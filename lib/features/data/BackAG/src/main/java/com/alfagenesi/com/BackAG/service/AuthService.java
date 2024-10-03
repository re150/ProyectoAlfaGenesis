package com.alfagenesi.com.BackAG.service;


import com.alfagenesi.com.BackAG.model.*;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.*;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord;
import com.google.firebase.cloud.FirestoreClient;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.*;
import java.util.concurrent.ExecutionException;
import org.springframework.beans.factory.annotation.Value;

@Service
@RequiredArgsConstructor
public class AuthService {

    @Value("${apiKey}")
    private String apiKey;
    private static final Logger logger = LoggerFactory.getLogger(AuthService.class);
    private Long noProfile;
    private static final String COLLECTION_NAME = "user";
    private static final String COLLECTION_PROFILE = "profile";
    private static final String COLLECTION_MEMBERS = "members";
    private static final String NUM_PROFILE = "noProfile";
    private static final String COLLECTION_TEAMS = "teams";


    public String add(Login user) throws FirebaseAuthException {
        Firestore dbFirestore = FirestoreClient.getFirestore();
        ApiFuture<QuerySnapshot> future = dbFirestore.collection(COLLECTION_NAME)
                .whereEqualTo("email", user.getEmail())
                .get();

        try {
            List<QueryDocumentSnapshot> documents = future.get().getDocuments();
            if (!documents.isEmpty()) {
                throw new RuntimeException("El usuario con este email ya existe");
            }
        } catch (InterruptedException | ExecutionException e) {
            throw new RuntimeException("Error al verificar la existencia del usuario", e);
        }
        String id = UUID.randomUUID().toString();

        User data = User.builder()
                .id(id)
                .email(user.getEmail())
                .noProfile(0L)
                .build();

        ApiFuture<WriteResult> collectionApiFuture = dbFirestore.collection(COLLECTION_NAME)
                .document(id).set(data);

        try {
            collectionApiFuture.get();
        } catch (InterruptedException | ExecutionException e) {
            throw new RuntimeException(e);
        }
        UserRecord.CreateRequest request = new UserRecord.CreateRequest()
                .setEmail(user.getEmail())
                .setPassword(user.getPassword());
        FirebaseAuth.getInstance().createUser(request);
        return "ok";
    }

    public String login(Login request) throws JsonProcessingException {
        String url = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=" + apiKey;
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        Map<String, Object> payload = new HashMap<>();
        payload.put("email", request.getEmail());
        payload.put("password", request.getPassword());
        payload.put("returnSecureToken", true);

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(payload, headers);
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> responseMap = mapper.readValue(response.getBody(), Map.class);
        Map<String, Object> responseEnd = new HashMap<>();

        responseEnd.put("idToken", responseMap.get("idToken"));
        return mapper.writeValueAsString(responseEnd);
    }

    public String createProfile(TemplateProfile request) {
        Firestore dbFirestore = FirestoreClient.getFirestore();

        ApiFuture<QuerySnapshot> future = dbFirestore.collection(COLLECTION_NAME)
                .whereEqualTo("email", request.getEmail())
                .get();

        try {
            List<QueryDocumentSnapshot> documents = future.get().getDocuments();
            if (!documents.isEmpty()) {
                QueryDocumentSnapshot document = documents.get(0);
                request.setId(document.getId());
                noProfile = document.getLong(NUM_PROFILE);
                // logger.info("num of profile",noProfile);
                if (noProfile <= 5) {
                    noProfile += 1;
                    ApiFuture<WriteResult> result = dbFirestore.collection(COLLECTION_NAME)
                            .document(request.getId())
                            .update(NUM_PROFILE, noProfile);
                } else {
                    throw new RuntimeException("Excede el numero de perfiles");
                }
            }
        } catch (InterruptedException | ExecutionException e) {
            throw new RuntimeException("Error al verificar la existencia del usuario", e);
        }

        Profile data = new Profile();
        data.setId(request.getId());
        data.setName(request.getName());
        data.setGrado(request.getGrado());
        data.setGrupo(request.getGrupo());
        data.setImgUrl(request.getImgUrl());
        data.setLevel(request.getLevel());
        data.setStars(request.getStars());
        data.setTeamStatus(request.getTeamStatus());



        dbFirestore.collection(COLLECTION_NAME).document(request.getId())
                .collection(COLLECTION_PROFILE).document(data.getName()).set(data);

        dbFirestore.collection(COLLECTION_NAME)
                .document(request.getId())
                .update("noProfile", noProfile);

        return "Nuevo perfil";
    }

    public String showProfiles(String request) {
        List<Profile> userProfiles = new ArrayList<>();
        String userId = getProfileIdByEmail(request);
        Firestore dbFirestore = FirestoreClient.getFirestore();

        ApiFuture<QuerySnapshot> future = dbFirestore.collection(COLLECTION_NAME)
                .document(userId)
                .collection(COLLECTION_PROFILE)
                .get();
        try {
            List<QueryDocumentSnapshot> documents = future.get().getDocuments();
            for (QueryDocumentSnapshot document : documents) {
                Profile profile = document.toObject(Profile.class);
                userProfiles.add(profile);
            }
        } catch (InterruptedException | ExecutionException e) {
            throw new RuntimeException("Error al obtener los perfiles del usuario", e);
        }

        Gson gson = new Gson();
        return gson.toJson(userProfiles);
    }

    private String getProfileIdByEmail(String email) {
        Firestore dbFirestore = FirestoreClient.getFirestore();
        Query query = dbFirestore.collection(COLLECTION_NAME)
                .whereEqualTo("email", email);

        ApiFuture<QuerySnapshot> future = query.get();

        try {
            List<QueryDocumentSnapshot> documents = future.get().getDocuments();
            if (!documents.isEmpty()) {
                return documents.get(0).getId();
            } else {
                throw new RuntimeException("No profile found with the given email.");
            }
        } catch (InterruptedException | ExecutionException e) {
            throw new RuntimeException("Error fetching profile ID", e);
        }
    }

    public String showAllProfile() {
        Firestore db = FirestoreClient.getFirestore();
        Query query = db.collection(COLLECTION_NAME);
        ApiFuture<QuerySnapshot> querySnapshot = query.get();
        List<String> profiles = new ArrayList<>();

        try {
            for (DocumentSnapshot document : querySnapshot.get().getDocuments()) {
                String id = document.getId();
                ApiFuture<QuerySnapshot> future = db.collection(COLLECTION_NAME)
                        .whereEqualTo("id", id)
                        .get();
                noProfile = document.getLong(NUM_PROFILE);
                if(noProfile != 0){
                    profiles.add(getProfiles(id).toString());
                }
            }
        } catch (InterruptedException | ExecutionException e) {
            e.printStackTrace();
        }

        Gson gson = new Gson();
        return gson.toJson(profiles);
    }

    private List<String> getProfiles(String request) {
        List<String> userProfiles = new ArrayList<>();
        String userId = request;

        Firestore dbFirestore = FirestoreClient.getFirestore();
        ApiFuture<QuerySnapshot> future = dbFirestore.collection(COLLECTION_NAME)
                .document(userId)
                .collection(COLLECTION_PROFILE)
                .get();

        try {
            //logger.info("np: {}",queryNoProfiles.get().getLong(NUM_PROFILE));
            List<QueryDocumentSnapshot> documents = future.get().getDocuments();
                for (QueryDocumentSnapshot document : documents) {
                    Profile profile = document.toObject(Profile.class);
                    userProfiles.add(profile.toString());
                }
        } catch(InterruptedException | ExecutionException e){
            throw new RuntimeException("Error al obtener los perfiles del usuario", e);
        }

        return userProfiles;
    }

    public String addMembers(String jsonData) {
        Firestore db = FirestoreClient.getFirestore();

        ObjectMapper objectMapper = new ObjectMapper();
        List<DataMember> members = new ArrayList<>();
        int nomMembers = 0;
        String nameT = null;

        try {
            JsonNode jsonNode = objectMapper.readTree(jsonData);

            JsonNode nomMembersNode = jsonNode.get("NomMembers");
            nomMembers = (nomMembersNode != null) ? nomMembersNode.asInt() : 0;

            JsonNode nameTNode = jsonNode.get("nameTeam");
            nameT = (nameTNode != null)? nameTNode.asText() : null;

            for (int i = 1; i <= nomMembers; i++) {
                String memberKey = "member" + i;
                JsonNode memberNode = jsonNode.get(memberKey);
                if (memberNode != null) {
                    String memberId = memberNode.get("id") != null ? memberNode.get("id").asText() : null;
                    String memberName = memberNode.get("name") != null ? memberNode.get("name").asText() : null;
                    if (memberId != null && memberName != null) {
                        members.add(new DataMember(memberId, memberName));
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        String id = UUID.randomUUID().toString();
        DataTeam teamD = new DataTeam();
        teamD.setId(id);
        teamD.setNomMembers(nomMembers);
        teamD.setNameTeam(nameT);

        db.collection(COLLECTION_TEAMS).document(id).set(teamD);
        if(nomMembers <= 5) {
            for (int i = 0; i < members.size(); i++) {
                int no = i + 1;

                db.collection(COLLECTION_NAME).document(members.get(i).getId())
                        .collection(COLLECTION_PROFILE).document(members.get(i).getName())
                                .update("teamStatus",true);

                db.collection(COLLECTION_TEAMS).document(id)
                        .collection(COLLECTION_MEMBERS).document("member" +no)
                        .set(members.get(i));
            }
        }

        return id;
    }
}
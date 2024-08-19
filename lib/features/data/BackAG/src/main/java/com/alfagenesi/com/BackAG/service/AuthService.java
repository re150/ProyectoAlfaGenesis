package com.alfagenesi.com.BackAG.service;


import com.alfagenesi.com.BackAG.model.Login;
import com.alfagenesi.com.BackAG.model.Profile;
import com.alfagenesi.com.BackAG.model.TemplateProfile;
import com.alfagenesi.com.BackAG.model.User;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.*;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.UserRecord;
import com.google.firebase.cloud.FirestoreClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import lombok.RequiredArgsConstructor;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
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
    private static final String NUM_PROFILE = "noProfile";


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

        responseEnd.put("idToken",responseMap.get("idToken"));
        //responseEnd.put("email",responseMap.get("email"));
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

                logger.info("num of profile",noProfile);
                if(noProfile <= 5 ){
                    noProfile +=1;
                    ApiFuture<WriteResult> result = dbFirestore.collection(COLLECTION_NAME)
                            .document(request.getId())
                            .update(NUM_PROFILE,noProfile);
                }
                else {
                    throw new RuntimeException("Excede el numero de perfiles");
                }
            }
        } catch (InterruptedException | ExecutionException e) {
            throw new RuntimeException("Error al verificar la existencia del usuario", e);
        }

        Profile data = new Profile();
                data.setName(request.getName());
                data.setGrado(request.getGrado());
                data.setGrupo(request.getGrupo());
                data.setImgUrl(request.getImgUrl());
                data.setLevel(request.getLevel());


        dbFirestore.collection(COLLECTION_NAME).document(request.getId())
                .collection(COLLECTION_PROFILE).document(data.getName()).set(data);

        dbFirestore.collection(COLLECTION_NAME)
                .document(request.getId())
                .update("noProfile",noProfile);

        return "Nuevo perfil";
    }
}
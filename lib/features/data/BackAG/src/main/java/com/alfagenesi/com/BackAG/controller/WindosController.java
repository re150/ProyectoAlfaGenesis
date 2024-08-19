package com.alfagenesi.com.BackAG.controller;

import com.alfagenesi.com.BackAG.model.Login;
import com.alfagenesi.com.BackAG.model.Profile;
import com.alfagenesi.com.BackAG.model.TemplateProfile;
import com.alfagenesi.com.BackAG.service.AuthService;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/next/alfa")
public class WindosController {
    @Autowired
    private AuthService authService;
    @PostMapping("/v1")
    public String welcom (){
        return "next windos";
    }

    @PostMapping("/NewProfile")
    public ResponseEntity<?> newProfile (@RequestBody TemplateProfile request){
        return ResponseEntity.ok(authService.createProfile(request));
    }

}
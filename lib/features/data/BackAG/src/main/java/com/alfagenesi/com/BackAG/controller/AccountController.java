package com.alfagenesi.com.BackAG.controller;

import com.alfagenesi.com.BackAG.model.TemplateProfile;
import com.alfagenesi.com.BackAG.service.AuthService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/next/alfa")
public class AccountController {
    @Autowired
    private AuthService authService;
    @PostMapping("/NewProfile")
    public ResponseEntity<?> newProfile (@RequestBody TemplateProfile request){
        return ResponseEntity.ok(authService.createProfile(request));
    }
    @GetMapping("/showProfile/{email}")
    public  ResponseEntity<?> showProfile(@PathVariable String email) throws JsonProcessingException {
        return ResponseEntity.ok(authService.showProfiles(email));
    }

}

package com.alfagenesi.com.BackAG.controller;

import com.alfagenesi.com.BackAG.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/next/alfa/teams")
public class TeamsController {
    @Autowired
    private AuthService authService;
    @PostMapping("/ShowAll")
    public ResponseEntity<?> showStudens (){
        return ResponseEntity.ok(authService.showAllProfile());
    }
}

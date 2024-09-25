package com.alfagenesi.com.BackAG.controller;

import com.alfagenesi.com.BackAG.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/next/alfa/teams")
public class TeamsController {
    @Autowired
    private AuthService authService;
    @GetMapping("/ShowAll")
    public ResponseEntity<?> showStudens (){
        return ResponseEntity.ok(authService.showAllProfile());
    }
    @PostMapping("/addMembers")
    public ResponseEntity<?> addMembers (@RequestBody String data){
        return ResponseEntity.ok(authService.addMembers(data));
    }
}

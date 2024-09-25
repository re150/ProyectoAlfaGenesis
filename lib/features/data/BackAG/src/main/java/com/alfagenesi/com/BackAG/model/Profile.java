package com.alfagenesi.com.BackAG.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Profile {
    int grado;
    int level;
    String grupo;
    String name;
    String imgUrl;
    int stars;
    Boolean teamStatus;
}

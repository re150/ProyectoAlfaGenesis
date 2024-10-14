package com.alfagenesi.com.BackAG.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DataTeam extends Profile {
    String id;
    String nameTeam;
    int nomMembers;
}
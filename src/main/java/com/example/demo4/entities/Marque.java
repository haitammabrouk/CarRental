package com.example.demo4.entities;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "marque")
public class Marque {

    @Id
    @Column(name = "nom_marque")
    private	String nom_marque;

    @OneToMany(mappedBy = "marque", cascade = CascadeType.ALL)
    private List<Voiture> voitures;

    @OneToMany(mappedBy = "marque", cascade = CascadeType.ALL)
    private List<Modele> modeles;


    public List<Voiture> getVoitures() {
        return voitures;
    }

    public void setVoitures(List<Voiture> voitures) {
        this.voitures = voitures;
    }

    public List<Modele> getModeles() {
        return modeles;
    }

    public void setModeles(List<Modele> modeles) {
        this.modeles = modeles;
    }

    public String getNom_marque() {
        return nom_marque;
    }

    public void setNom_marque(String nom_marque) {
        this.nom_marque = nom_marque;
    }

}

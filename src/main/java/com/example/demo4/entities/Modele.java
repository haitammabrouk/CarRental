package com.example.demo4.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "modele")
public class Modele {

    @Id
    @Column(name = "nom_modele")
    private	String nom_modele;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "nom_marque")
    private Marque marque;

    public Marque getMarque() {
        return marque;
    }

    public void setMarque(Marque marque) {
        this.marque = marque;
    }

    public String getNom_modele() {
        return nom_modele;
    }

    public void setNom_modele(String nom_modele) {
        this.nom_modele = nom_modele;
    }


}

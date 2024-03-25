package com.example.demo4.entities;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "voiture")
public class Voiture {

    public enum MoteurEnum {
        DIESEL,
        ESSENCE
    }

    @Id
    @Column(name = "matricule")
    private String matricule;

    @Lob
    @Column(name = "image", columnDefinition = "BLOB")
    private byte[] image;

    @Column(name = "prix")
    private double prix;

    @Column(name = "nbr_places")
    private int nbrPlaces;

    @Column(name = "type_moteur")
    @Enumerated(EnumType.STRING)
    private MoteurEnum moteurType;

    @OneToMany(mappedBy = "voiture")
    private List<Reservation> reservations ;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "nom")
    private Marque marque ;

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public int getNbrPlaces() {
        return nbrPlaces;
    }

    public void setNbrPlaces(int nbrPlaces) {
        this.nbrPlaces = nbrPlaces;
    }

    public MoteurEnum getMoteurType() {
        return moteurType;
    }

    public void setMoteurType(MoteurEnum moteurType) {
        this.moteurType = moteurType;
    }

    public List<Reservation> getReservations() {
        return reservations;
    }

    public void setReservations(List<Reservation> reservations) {
        this.reservations = reservations;
    }

    public Marque getMarque() {
        return marque;
    }

    public void setMarque(Marque marque) {
        this.marque = marque;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }
}

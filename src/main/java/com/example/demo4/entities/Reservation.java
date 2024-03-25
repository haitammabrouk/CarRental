package com.example.demo4.entities;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "reservation")
public class Reservation {

    @Id
    @Column(name = "reservation_id")
    private int reservation_id;

    @Column(name = "date_debut")
    private Date date_debut;

    @Column(name = "date_fin")
    private Date date_fin;



    @Column(name = "montant_paye")
    private double montant_paye;

    @Column(name = "date_paiement")
    private Date date_paiement;

    @ManyToOne
    @JoinColumn(name = "cin")
    private Client client;

    @ManyToOne
    @JoinColumn(name = "matricule")
    private Voiture voiture;

    @Column(name = "num_carte")
    private String numeroCarte;

    @Column(name = "expiry")
    private String expiration;

    @Column(name = "num_ver")
    private String numeroVerification;

    public int getReservation_id() {
        return reservation_id;
    }

    public void setReservation_id(int reservation_id) {
        this.reservation_id = reservation_id;
    }

    public Date getDate_debut() {
        return date_debut;
    }

    public void setDate_debut(Date date_debut) {
        this.date_debut = date_debut;
    }

    public Date getDate_fin() {
        return date_fin;
    }

    public void setDate_fin(Date date_fin) {
        this.date_fin = date_fin;
    }

    public double getMontant_paye() {
        return montant_paye;
    }

    public void setMontant_paye(double montant_paye) {
        this.montant_paye = montant_paye;
    }

    public Date getDate_paiement() {
        return date_paiement;
    }

    public void setDate_paiement(Date date_paiement) {
        this.date_paiement = date_paiement;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Voiture getVoiture() {
        return voiture;
    }

    public void setVoiture(Voiture voiture) {
        this.voiture = voiture;
    }

    public String getNumeroCarte() {
        return numeroCarte;
    }

    public void setNumeroCarte(String numeroCarte) {
        this.numeroCarte = numeroCarte;
    }

    public String getExpiration() {
        return expiration;
    }

    public void setExpiration(String expiration) {
        this.expiration = expiration;
    }

    public String getNumeroVerification() {
        return numeroVerification;
    }

    public void setNumeroVerification(String numeroVerification) {
        this.numeroVerification = numeroVerification;
    }
}

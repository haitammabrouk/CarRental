package com.example.demo4.dao;

import com.example.demo4.entities.Marque;
import com.example.demo4.entities.Modele;
import com.example.demo4.entities.Reservation;
import com.example.demo4.entities.Voiture;
import com.example.demo4.repository.DBManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import java.sql.SQLException;
import java.util.List;

public class VoitureDao {
    private DBManager manager = DBManager.getInstance();

    private static VoitureDao voitureDAO = null;

    private VoitureDao() {

    }

    public static VoitureDao getInstance() {
        if(voitureDAO == null) {
            voitureDAO = new VoitureDao();
        }
        return voitureDAO;
    }


    public List<Object> getFuelTypes(){
        try {
            manager.begin();
            Query query = manager.entity.createQuery("SELECT DISTINCT v.moteurType FROM Voiture v");
            List<Object> moteurTypes = query.getResultList();
            manager.commit();
            return moteurTypes;
        } catch (Exception e) {
            throw e;
        }
    }

    public Voiture findVoiture(String matricule) throws SQLException{
        Voiture voiture = manager.entity.getReference(Voiture.class, matricule);
        if(voiture == null){
            throw new SQLException("voiture not found in database");
        }
        return voiture;
    }

    public Voiture updateVoiture(String matricule, int nbrPlaces, String moteurType) throws SQLException {
        Voiture voiture = findVoiture(matricule);
        if("Diesel".equals(moteurType)) {
            voiture.setMoteurType(Voiture.MoteurEnum.DIESEL);
        }else if("Essence".equals(moteurType)) {
            voiture.setMoteurType(Voiture.MoteurEnum.ESSENCE);
        }
        voiture.setNbrPlaces(nbrPlaces);
        manager.merge(voiture);
        return voiture;
    }

    public List<Voiture> returnVoitures() {
        String jpql = "select v from Voiture v";
        Query query = manager.entity.createQuery(jpql);
        List<Voiture> voitures = query.getResultList();
        return voitures;
    }

    public void addMarque(Marque marque) {
        manager.begin();
        manager.persist(marque);
        manager.commit();
    }
    public List<Object[]> getAllVoitures() {
        try {
            manager.begin();
            TypedQuery<Object[]> query = manager.entity.createQuery("SELECT  DISTINCT v.matricule, v.prix, v.nbrPlaces, v.moteurType, v.marque, m.nom_modele  FROM Voiture v JOIN Modele m ON v.marque = m.marque" ,Object[].class);
            List<Object[]> voitures = query.getResultList();
            manager.commit();
            return voitures;
        } catch (Exception e) {
            manager.rollback();
            throw e;
        }
    }

    public void addModele(Modele modele) {
        manager.begin();
        manager.persist(modele);
        manager.commit();
    }

    public void addVoiture(Voiture voiture) {
        try {
            manager.begin();
            manager.persist(voiture);
            manager.commit();
        } catch (Exception e) {
            manager.rollback();
            throw e;
        }
    }

    public List<Object[]> rechercherParMarque(Marque marque) {
        try {
            manager.begin();
            TypedQuery<Object[]> query = manager.entity.createQuery(
                    "SELECT DISTINCT v.matricule, v.prix, v.nbrPlaces, v.moteurType, v.marque, m.nom_modele FROM Voiture v JOIN Modele m ON v.marque = m.marque WHERE v.marque = :marque", Object[].class);
            query.setParameter("marque", marque);
            List<Object[]> voitureRecherche = query.getResultList();

            return voitureRecherche;
        } catch (Exception e) {
            manager.rollback();
            throw e;
        }
    }
    public void removeVoiture(String matricule) throws SQLException {

        manager.begin();

        Voiture voiture = findVoiture(matricule);

        List<Reservation> reservations = voiture.getReservations();
        if (reservations != null) {

            for (Reservation reservation : reservations) {
                manager.entity.remove(reservation);
                manager.commit();
            }
        }


        Marque marque = voiture.getMarque();
        if (marque != null) {
            List<Modele> modeles = marque.getModeles();
            if (modeles != null) {
                for (Modele modele : modeles) {
                    manager.entity.remove(modele);
                    manager.commit();
                }
            }
            manager.entity.remove(voiture);

            manager.entity.remove(marque);

            manager.commit();
        }
    }
}

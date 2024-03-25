package com.example.demo4.dao;

import com.example.demo4.entities.Marque;
import com.example.demo4.repository.DBManager;
import jakarta.persistence.Query;

import java.sql.SQLException;
import java.util.List;

public class MarqueDao {

    private DBManager manager = DBManager.getInstance();

    private static MarqueDao marqueDAO = null;

    private MarqueDao() {

    }

    public static MarqueDao getInstance() {
        if(marqueDAO == null) {
            marqueDAO = new MarqueDao();
        }
        return marqueDAO;
    }

    public void addMarque(Marque marque) {
        manager.begin();
        manager.persist(marque);
        manager.end();
    }

    public Marque findMarque(String nom) throws SQLException {
        Marque marque = manager.entity.getReference(Marque.class, nom);
        if(marque == null){
            throw new SQLException("marque not found in database");
        }
        return marque;
    }

    public Marque updateMarque(String nom, String nouveauNom) throws SQLException {
        Marque marque = findMarque(nom);
        marque.setNom_marque(nouveauNom);
        manager.merge(marque);
        return marque;
    }

    public void removeMarque(String nom) throws SQLException {
        Marque marque = findMarque(nom);
        manager.entity.remove(marque);
        manager.end();
    }

    public List<Marque> returnMarques() {
        String jpql = "select m from Marque m";
        Query query = manager.entity.createQuery(jpql);
        List<Marque> marques = query.getResultList();
        return marques;
    }

}

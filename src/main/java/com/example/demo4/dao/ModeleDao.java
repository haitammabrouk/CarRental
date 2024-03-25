package com.example.demo4.dao;

import com.example.demo4.entities.Modele;
import com.example.demo4.repository.DBManager;
import jakarta.persistence.Query;

import java.sql.SQLException;
import java.util.List;

public class ModeleDao {

    private DBManager manager = DBManager.getInstance();

    private static ModeleDao modeleDAO = null;

    private ModeleDao() {

    }

    public static ModeleDao getInstance() {
        if(modeleDAO == null) {
            modeleDAO = new ModeleDao();
        }
        return modeleDAO;
    }

    public void addModele(Modele modele) {
        manager.begin();
        manager.persist(modele);
        manager.end();
    }

    public Modele findModele(String nom) throws SQLException{
        Modele modele = manager.entity.getReference(Modele.class, nom);
        if(modele == null){
            throw new SQLException("modele not found in database");
        }
        return modele;
    }

    public Modele updateModele(String nom, String nouveauNom) throws SQLException {
        Modele modele = findModele(nom);
        modele.setNom_modele(nouveauNom);
        manager.merge(modele);
        return modele;
    }

    public void removeModele(String nom) throws SQLException {
        Modele modele = findModele(nom);
        manager.entity.remove(modele);
        manager.end();
    }

    public List<Modele> returnModeles() {
        String jpql = "select m from Modele m";
        Query query = manager.entity.createQuery(jpql);
        List<Modele> modeles = query.getResultList();
        return modeles;
    }
}

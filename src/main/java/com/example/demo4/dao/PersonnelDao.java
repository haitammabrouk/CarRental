package com.example.demo4.dao;

import com.example.demo4.entities.Personnel;
import com.example.demo4.repository.DBManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;

import java.sql.SQLException;
import java.util.List;

public class PersonnelDao {

    private DBManager manager = DBManager.getInstance();
    private static PersonnelDao personnelDAO = null;

    private PersonnelDao() {

    }

    public static PersonnelDao getInstance() {
        if(personnelDAO == null) {
            personnelDAO = new PersonnelDao();
        }
        return personnelDAO;
    }

    public Personnel findPersonnelByEmailAndPassword(String email, String password) throws SQLException{

        manager.begin();

        Personnel personnel = null;
        String jpql = "select c.cin from Personnel c where c.email = :email and c.password = :password";
        Query query = manager.entity.createQuery(jpql);
        query.setParameter("email", email);
        query.setParameter("password", password);

        try {
            String cin = (String)query.getSingleResult();
            if (!cin.equals(null)){
                personnel = this.findPersonnel(cin);
                return personnel;
            }
        } catch (NoResultException e) {
            System.out.println("NO RESULT WAS FOUND");
        }

        return personnel;
    }

    public boolean authenticate(String email, String password) {

        manager.begin();

        String jpql = "select c.email, c.password from Personnel c where c.email = :email and c.password = :password";
        Query query = manager.entity.createQuery(jpql);
        query.setParameter("email", email);
        query.setParameter("password", password);

        try {
            Object[] result = (Object[]) query.getSingleResult();
            if (result != null && result.length == 2) {
                String resultedEmail = (String) result[0];
                String resultedPassword = (String) result[1];

                if (resultedEmail != null && resultedPassword != null) {
                    return true;
                }
            }
        } catch (NoResultException e) {
            System.out.println("NO RESULT WAS FOUND");
        }
        return false;
    }

    public void addPersonnel(Personnel personnel) {
        manager.begin();
        manager.persist(personnel);
        manager.end();
    }

    public Personnel findPersonnel(String cni) throws SQLException{
        Personnel personnel = manager.entity.getReference(Personnel.class, cni);
        if(personnel == null){
            throw new SQLException("personnel not found in database");
        }
        return personnel;
    }

    public Personnel updatePersonnel(String cni, String nom, String prenom, String email, String password) throws SQLException {
        Personnel personnel = findPersonnel(cni);
        personnel.setNom(nom);
        personnel.setPrenom(prenom);
        personnel.setEmail(email);
        personnel.setPassword(password);
        manager.merge(personnel);
        return personnel;
    }

    public void removePersonnel(String cni) throws SQLException {
        Personnel personnel = findPersonnel(cni);
        manager.entity.remove(personnel);
        manager.end();
    }

    public List<Personnel> returnPersonnels() {
        String jpql = "select p from Personnel p";
        Query query = manager.entity.createQuery(jpql);
        List<Personnel> personnels = query.getResultList();
        return personnels;
    }
}

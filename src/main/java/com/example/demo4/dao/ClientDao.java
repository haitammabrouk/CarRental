package com.example.demo4.dao;

import com.example.demo4.entities.Client;
import com.example.demo4.repository.DBManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class ClientDao {

    public DBManager manager = DBManager.getInstance();

    private static final int EXPIRATION_TIME_IN_MINUTES = 3;



    private static ClientDao clientDAO = null;

    private ClientDao() {

    }


    public static ClientDao getInstance() {
        if(clientDAO == null) {
            clientDAO = new ClientDao();
        }
        return clientDAO;
    }

    public boolean checkPasswordValidationValidity(String password, String confirmedPassword){
        return password.equals(confirmedPassword);
    }

    public boolean checkCINAlreadyExist(String cin){

        manager.begin();

        String jpql = "select c.cin from Client c where c.cin = :cin";
        Query query = manager.entity.createQuery(jpql);
        query.setParameter("cin", cin);

        try{
            String resultedCIN = (String)query.getSingleResult();
            if(resultedCIN != null) {
                return true;
            }
        }catch (NoResultException e){
            System.out.println("RESULT NOT FOUND");
        }
        return false;
    }

    public boolean checkEmailAlreadyExist(String email){

        manager.begin();

        String jpql = "select c.email from Client c where c.email = :email";
        Query query = manager.entity.createQuery(jpql);
        query.setParameter("email", email);

        try{
            String resultedEmail = (String)query.getSingleResult();
            if(resultedEmail != null) {
                return true;
            }
        }catch (NoResultException e){
            System.out.println("RESULT NOT FOUND");
        }

        return false;
    }

    public Client findClientByEmailAndPassword(String email, String password) throws SQLException{

        manager.begin();

        Client client = null;
        String jpql = "select c.cin from Client c where c.email = :email and c.password = :password";
        Query query = manager.entity.createQuery(jpql);
        query.setParameter("email", email);
        query.setParameter("password", password);

        try {
            String cin = (String)query.getSingleResult();
            if (!cin.equals(null)){
                client = this.findClient(cin);
                return client;
            }
        } catch (NoResultException e) {
            System.out.println("NO RESULT WAS FOUND");
        }

        return client;
    }


    public boolean authenticate(String email, String password) {

        manager.begin();

        String jpql = "select c.email, c.password from Client c where c.email = :email and c.password = :password";
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

    public Client findClientByEmail(String email){
        manager.begin();
        String jpql = "select c from Client c where c.email = :email";
        TypedQuery<Client> query = manager.entity.createQuery(jpql, Client.class);
        query.setParameter("email", email);
        Client retrievedClient = query.getSingleResult();

        if(retrievedClient != null){
            return retrievedClient;
        }
        return null;
    }

    public Client findClientByToken(String token){
        manager.begin();
        String jpql = "select c from Client c where c.token = :token";
        TypedQuery<Client> query = manager.entity.createQuery(jpql, Client.class);
        query.setParameter("token", token);
        Client retrievedClient = query.getSingleResult();

        if(retrievedClient != null){
            return retrievedClient;
        }
        return null;
    }

    public String generateEtudiantToken(){
        return UUID.randomUUID().toString();
    }

    public Date calculateExpirationDate() {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.MINUTE, EXPIRATION_TIME_IN_MINUTES);
        return calendar.getTime();
    }

    public boolean isTokenValid(Date expirationDate) {
        if (expirationDate == null) {
            return false;
        }
        Date currentDate = new Date();
        return currentDate.before(expirationDate);
    }


    public void addClient(Client client) {
        manager.begin();
        manager.persist(client);
    }

    public Client findClient(String cni) throws SQLException{
        manager.begin();
        Client client = manager.entity.getReference(Client.class, cni);
        if(client == null){
            throw new SQLException("client not found in database");
        }
        return client;
    }

    public Client updateClient(String cni, String nom, String prenom, String email, String password, String token, Date expirationToken) throws SQLException {
        manager.begin();
        Client client = findClient(cni);
        client.setNom(nom);
        client.setPrenom(prenom);
        client.setEmail(email);
        client.setPassword(password);
        client.setToken(token);
        client.setExpirationToken(expirationToken);
        manager.merge(client);
        return client;
    }

    public void removeClient(String cni) throws SQLException {
        manager.begin();
        Client client = findClient(cni);
        manager.entity.remove(client);
        manager.commit();
    }

    public List<Client> returnClients() {
        manager.begin();
        String jpql = "select c from Client c";
        Query query = manager.entity.createQuery(jpql);
        List<Client> clients = query.getResultList();
        return clients;
    }

    public List<Client> rechercherParNom(String nom) {
        try {
            manager.begin();
            TypedQuery<Client> query = manager.entity.createQuery(
                    "SELECT  c FROM Client c WHERE c.nom = :nom", Client.class);
            query.setParameter("nom", nom);
            List<Client> ClientRecherche = query.getResultList();

            System.out.println("Résultats  : " + ClientRecherche);

            return ClientRecherche;

        } catch (Exception e) {
            manager.rollback();
            throw e;
        }
    }
}

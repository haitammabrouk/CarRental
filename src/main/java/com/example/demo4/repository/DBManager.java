package com.example.demo4.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DBManager {

    public EntityManagerFactory factory = Persistence.createEntityManagerFactory("default");
    public EntityManager entity = factory.createEntityManager();

    private static DBManager manager = null;

    private DBManager() {

    }

    public static DBManager getInstance() {
        if(manager == null) {
            manager = new DBManager();
        }
        return manager;
    }

    public void begin() {
        if(!entity.getTransaction().isActive()){
            entity.getTransaction().begin();
        }
    }

    public <T> void persist(T obj) {
        entity.persist(obj);
        entity.getTransaction().commit();
    }

    public <T> void merge(T obj) {
        entity.merge(obj);
        entity.getTransaction().commit();
    }

    public void end() {
        factory.close();
        entity.close();
    }

    public void commit(){
        if (entity.getTransaction().isActive()) {
            entity.getTransaction().commit();
        }
    }

    public void rollback() {
        if (entity.getTransaction().isActive()) {
            entity.getTransaction().rollback();
        }
    }
}

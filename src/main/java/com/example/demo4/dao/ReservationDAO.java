package com.example.demo4.dao;

import com.example.demo4.entities.Marque;
import com.example.demo4.entities.Reservation;
import com.example.demo4.entities.Voiture;
import com.example.demo4.repository.DBManager;
import jakarta.persistence.EntityNotFoundException;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import java.sql.SQLException;
import java.util.List;

public class ReservationDAO {

    private DBManager manager = DBManager.getInstance();

    private static ReservationDAO reservationDAO = null;

    private ReservationDAO() {

    }

    public static ReservationDAO getInstance() {
        if(reservationDAO == null) {
            reservationDAO = new ReservationDAO();
        }
        return reservationDAO;
    }

    public void addReservation(Reservation reservation) {
        manager.begin();
        manager.persist(reservation);
        manager.end();
    }

    public Reservation findReservation(int id) throws SQLException {
        Reservation reservation = manager.entity.getReference(Reservation.class, id);
        if(reservation == null){
            throw new SQLException("reservation not found in database");
        }
        return reservation;
    }

    public void removeReservation(int id) throws SQLException {
        try {
            manager.begin();
            Reservation reservation = findReservation(id);
            manager.entity.remove(reservation);
            manager.commit();
        } catch (EntityNotFoundException e) {
            manager.rollback();
        }
    }

    public List<Reservation> returnReservations() {
        String jpql = "select r from Reservation r";
        Query query = manager.entity.createQuery(jpql);
        List<Reservation> reservations = query.getResultList();
        return reservations;
    }

    public List<Reservation> rechercherParMarque(Marque marque) {
        try {
            manager.begin();
            TypedQuery<Reservation> query = manager.entity.createQuery(
                    "SELECT r FROM Reservation r  where  r.voiture.marque= :marque", Reservation.class);
            query.setParameter("marque", marque);
            List<Reservation> reservations = query.getResultList();


            return reservations;

        } catch (Exception e) {
            manager.rollback();
            throw e;
        }
    }
}

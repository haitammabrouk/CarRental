package com.example.demo4.controllers;

import com.example.demo4.dao.ClientDao;
import com.example.demo4.dao.ReservationDAO;
import com.example.demo4.dao.VoitureDao;
import com.example.demo4.entities.Client;
import com.example.demo4.entities.Reservation;
import com.example.demo4.entities.Voiture;
import com.example.demo4.repository.DBManager;
import jakarta.persistence.Query;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.time.Duration;
import java.time.Instant;
import java.util.Date;

@WebServlet(name = "paymentServlet", value = "/payment-servlet")
public class PaymentServlet extends HttpServlet {

    public HttpSession session;

    private DBManager manager = DBManager.getInstance();

    private VoitureDao voitureDAO = VoitureDao.getInstance();

    private ClientDao clientDAO = ClientDao.getInstance();

    private ReservationDAO reservationDAO = ReservationDAO.getInstance();


    private String message;

    public void init() {
        message = "Hello World!";
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        session = req.getSession();

        String cardNumber = req.getParameter("card_number");
        String expiration = req.getParameter("expiration");
        String verification = req.getParameter("verification");

        Date dateDebut = (Date) session.getAttribute("selectedDateDebut");
        Date dateFin = (Date) session.getAttribute("selectedDateFin");

        Instant instantDebut = dateDebut.toInstant();
        Instant instantFin = dateFin.toInstant();

        Duration duration = Duration.between(instantDebut, instantFin);

        long days = duration.toDays();

        double montantPaye = (double) session.getAttribute("prix")*(days+2);
        session.setAttribute("total", montantPaye);

        String matricule = (String) session.getAttribute("matricule");

        Voiture voiture = new Voiture();
        try {
            voiture = voitureDAO.findVoiture(matricule);
        }catch(SQLException ex){
            ex.printStackTrace();
        }

        String cin = (String)session.getAttribute("id");

        Client client = new Client();
        try{
            client = clientDAO.findClient(cin);
        }catch (SQLException ex){
            ex.printStackTrace();
        }

        Date datePaiement = new Date();

        Reservation reservation = new Reservation();
        reservation.setVoiture(voiture);
        reservation.setExpiration(expiration);
        reservation.setNumeroVerification(verification);
        reservation.setMontant_paye(montantPaye);
        reservation.setNumeroCarte(cardNumber);
        reservation.setDate_fin(dateFin);
        reservation.setClient(client);
        reservation.setDate_debut(dateDebut);
        reservation.setDate_paiement(datePaiement);

        manager.begin();
        manager.persist(reservation);

        req.setAttribute("success","your payment has been confirmed !");

        getServletContext().getRequestDispatcher("/paymentConfirmation.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String matricule = req.getParameter("id");
        getServletContext().getRequestDispatcher("/payment.jsp").forward(req, resp);
    }

    public void destroy() {
    }

}

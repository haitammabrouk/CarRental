package com.example.demo4.controllers;


import com.example.demo4.dao.ReservationDAO;
import com.example.demo4.entities.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/afficherReservations")

public class AfficherReservationsServlet  extends HttpServlet {

    HttpSession session ;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession();
       ReservationDAO reservationDao = ReservationDAO.getInstance();
        List<Reservation> reservations = reservationDao.returnReservations();

        session.setAttribute("reservations", reservations);

        Reservation res = reservations.get(1);
        System.out.println(res.getReservation_id());
        System.out.println(res.getVoiture().getMatricule());
        System.out.println(res.getDate_debut());
        System.out.println(res.getDate_fin());
        System.out.println(res.getMontant_paye());
        System.out.println(res.getClient().getCin());
        System.out.println(res.getNumeroCarte());
        System.out.println(res.getNumeroVerification());
        System.out.println(res.getExpiration());

        getServletContext().getRequestDispatcher("/reservations.jsp").forward(request, response);

    }
}

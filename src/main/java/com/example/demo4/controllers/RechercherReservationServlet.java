package com.example.demo4.controllers;

import com.example.demo4.dao.ReservationDAO;
import com.example.demo4.entities.Marque;
import com.example.demo4.entities.Reservation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
@WebServlet("/rechercherReservation")

public class RechercherReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String marque1 = request.getParameter("marque");
        Marque marque = new Marque();
        marque.setNom_marque(marque1);

        List<Reservation> reservations = ReservationDAO.getInstance().rechercherParMarque(marque);

        session.setAttribute("reservations", reservations);

        request.getRequestDispatcher("reservations.jsp").forward(request, response);
    }
}

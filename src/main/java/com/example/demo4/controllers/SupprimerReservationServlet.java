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
import java.sql.SQLException;
import java.util.List;

@WebServlet("/SupprimerReservation")
public class SupprimerReservationServlet extends HttpServlet {

    HttpSession session ;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException {
        session = request.getSession();

        int  reservation_id= Integer.parseInt(request.getParameter("reservation_id"));

        try {
           ReservationDAO.getInstance().removeReservation(reservation_id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        List<Reservation> reservations = ReservationDAO.getInstance().returnReservations();
        session.setAttribute("reservations",reservations);


        getServletContext().getRequestDispatcher("/reservations.jsp").forward(request, response);

    }
}


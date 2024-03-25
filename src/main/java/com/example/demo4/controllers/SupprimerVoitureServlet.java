package com.example.demo4.controllers;

import com.example.demo4.dao.VoitureDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/SupprimerVoiture")
public class SupprimerVoitureServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException {
        String matricule = request.getParameter("matricule");

        try {
            VoitureDao.getInstance().removeVoiture(matricule);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("voitures", VoitureDao.getInstance().getAllVoitures());
        request.getRequestDispatcher("voitures.jsp").forward(request, response);

    }
}

package com.example.demo4.controllers;


import com.example.demo4.dao.ClientDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/SupprimerUtilisateur")
public class SupprimerUtilisateurServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException {
        String cin = request.getParameter("cin");

        try {
            ClientDao.getInstance().removeClient(cin);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("clients", ClientDao.getInstance().returnClients());


        request.getRequestDispatcher("Utilisateurs.jsp").forward(request, response);

    }
}

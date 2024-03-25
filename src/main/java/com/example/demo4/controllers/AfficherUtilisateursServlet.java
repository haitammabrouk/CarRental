package com.example.demo4.controllers;

import com.example.demo4.dao.ClientDao;
import com.example.demo4.entities.Client;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/afficherUtilisateurs")

public class AfficherUtilisateursServlet  extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ClientDao clientDao = ClientDao.getInstance();
        List<Client> clients = clientDao.returnClients();

        request.setAttribute("clients", clients);

        request.getRequestDispatcher("Utilisateurs.jsp").forward(request, response);

    }
}

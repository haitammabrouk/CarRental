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
@WebServlet("/rechercherUtilisateur")

public class RechercherUtilisateursServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nom = request.getParameter("nom");

        List<Client> resultats = ClientDao.getInstance().rechercherParNom(nom);

        request.setAttribute("UtilisateurRecherche", resultats);

        request.getRequestDispatcher("/afficher_recherche_utilisateur.jsp").forward(request, response);
    }
}

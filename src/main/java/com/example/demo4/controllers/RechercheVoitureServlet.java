package com.example.demo4.controllers;

import java.io.IOException;
import java.util.List;

import com.example.demo4.dao.VoitureDao;
import com.example.demo4.entities.Marque;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/rechercheVoiture")
public class RechercheVoitureServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String marque = request.getParameter("marque");
        Marque marque1 = new Marque();
        marque1.setNom_marque(marque);

        List<Object[]> resultats = VoitureDao.getInstance().rechercherParMarque(marque1);

        request.setAttribute("voitureRecherche", resultats);

        request.getRequestDispatcher("/afficher_recherche_voiture.jsp").forward(request, response);
    }
}


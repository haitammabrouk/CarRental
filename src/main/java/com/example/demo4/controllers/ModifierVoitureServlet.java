package com.example.demo4.controllers;

import com.example.demo4.dao.VoitureDao;
import com.example.demo4.entities.Marque;
import com.example.demo4.entities.Modele;
import com.example.demo4.entities.Voiture;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/ModifierVoiture")
public class ModifierVoitureServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String matriculeancien = (String) session.getAttribute("matriculeToModify");

        String matriculenew = request.getParameter("matriculenew");
        String typeMoteurnew = request.getParameter("type_moteurnew");
        String marqueNomnew = request.getParameter("marquenew");
        String modeleNomnew = request.getParameter("modelenew");
        String nbPlacesNewString = request.getParameter("nb_placesnew");
        int nbPlacesnew = (nbPlacesNewString != null && !nbPlacesNewString.isEmpty()) ? Integer.parseInt(nbPlacesNewString) : 0;

        String prixReservationNewString = request.getParameter("prix_reservationnew");
        double prixReservationnew = (prixReservationNewString != null && !prixReservationNewString.isEmpty()) ? Double.parseDouble(prixReservationNewString) : 0.0;


        try {
            VoitureDao.getInstance().removeVoiture(matriculeancien);
        } catch (SQLException e) {
            e.printStackTrace();

        }


        Voiture voiture = new Voiture();
        voiture.setMatricule(matriculenew);
        voiture.setMoteurType(Voiture.MoteurEnum.valueOf(typeMoteurnew.toUpperCase()));
        voiture.setNbrPlaces(nbPlacesnew);
        voiture.setPrix(prixReservationnew);


        Marque marque = new Marque();
        marque.setNom_marque(marqueNomnew);

        VoitureDao.getInstance().addMarque(marque);

        Modele modele = new Modele();
        modele.setNom_modele(modeleNomnew);
        modele.setMarque(marque);
        VoitureDao.getInstance().addModele(modele);

        voiture.setMarque(marque);

        VoitureDao.getInstance().addVoiture(voiture);


        response.sendRedirect(request.getContextPath() + "/afficherVoitures");

    }
}

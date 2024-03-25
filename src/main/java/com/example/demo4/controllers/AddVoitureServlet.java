package com.example.demo4.controllers;

import com.example.demo4.dao.VoitureDao;
import com.example.demo4.entities.Marque;
import com.example.demo4.entities.Modele;
import com.example.demo4.entities.Voiture;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;


@WebServlet("/add-voiture-servlet")
@MultipartConfig
public class AddVoitureServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String matricule = request.getParameter("matricule");
        String fuelTypeString = request.getParameter("fuel_type");
        Voiture.MoteurEnum fuelTypeEnum = Voiture.MoteurEnum.valueOf(fuelTypeString);
        String marqueNom = request.getParameter("marque");
        int nbPlaces = Integer.parseInt(request.getParameter("nb_places"));
        String modeleNom = request.getParameter("modele");
        double prixReservation = Double.parseDouble(request.getParameter("prix_reservation"));


        Voiture voiture = new Voiture();
        voiture.setMatricule(matricule);
        voiture.setMoteurType(fuelTypeEnum);
        voiture.setNbrPlaces(nbPlaces);
        voiture.setPrix(prixReservation);

        Part imagePart = request.getPart("image");

        byte[] imageBytes = imagePart.getInputStream().readAllBytes();


        voiture.setImage(imageBytes);

        Marque marque = new Marque();
        marque.setNom_marque(marqueNom);

        VoitureDao.getInstance().addMarque(marque);

        Modele modele = new Modele();
        modele.setNom_modele(modeleNom);
        modele.setMarque(marque);
        VoitureDao.getInstance().addModele(modele);

        voiture.setMarque(marque);

        VoitureDao.getInstance().addVoiture(voiture);


        response.sendRedirect(request.getContextPath() + "/afficherVoitures");


    }
}

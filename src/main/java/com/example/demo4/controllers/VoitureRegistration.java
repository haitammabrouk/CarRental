package com.example.demo4.controllers;


import com.example.demo4.dao.MarqueDao;
import com.example.demo4.dao.VoitureDao;
import com.example.demo4.entities.Marque;
import com.example.demo4.entities.Voiture;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "voitureServlet", value = "/voiture-servlet")
@MultipartConfig
public class VoitureRegistration extends HttpServlet {

    private VoitureDao voitureDao = VoitureDao.getInstance();
    private MarqueDao marqueDao = MarqueDao.getInstance();

    public HttpSession session;


    private String message;

    public void init() {
        message = "Hello World!";
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Marque marque = null;

        MarqueDao marqueDao = MarqueDao.getInstance();

        try {
            marque = marqueDao.findMarque("Mercedes");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        Voiture voiture = new Voiture();

        voiture.setMatricule("AB9099B");

        voiture.setMarque(marque);

        voiture.setPrix(1200.00);
        voiture.setNbrPlaces(4);
        voiture.setMoteurType(Voiture.MoteurEnum.ESSENCE);

        Part imagePart = req.getPart("image");

        byte[] imageBytes = imagePart.getInputStream().readAllBytes();


        voiture.setImage(imageBytes);

        voitureDao.addVoiture(voiture);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Voiture voiture = null;
        session = req.getSession();

        try{
            voiture = voitureDao.findVoiture("A");
            session.setAttribute("voiture", voiture);
            getServletContext().getRequestDispatcher("/displayVoiture.jsp").forward(req, resp);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void destroy() {
    }
}

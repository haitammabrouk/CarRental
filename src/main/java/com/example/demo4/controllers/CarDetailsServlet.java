package com.example.demo4.controllers;

import com.example.demo4.entities.Voiture;
import com.example.demo4.repository.DBManager;
import jakarta.persistence.Query;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "carDetailsServlet", value = "/car-details-servlet")
public class CarDetailsServlet extends HttpServlet {

    public HttpSession session;

    private DBManager manager = DBManager.getInstance();


    private String message;

    public void init() {
        message = "Hello World!";
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        session = req.getSession();

        String matricule = req.getParameter("id");

        String jpql = "SELECT v.nbrPlaces, v.prix, v.moteurType, m.nom_marque, mo.nom_modele, v.image " +
                "FROM Voiture v " +
                "JOIN v.marque m " +
                "JOIN m.modeles mo " +
                "WHERE v.matricule = :matricule";

        Query query = manager.entity.createQuery(jpql);
        query.setParameter("matricule", matricule);

        Object[] voiture = (Object[]) query.getSingleResult();

        byte[] imageBytes = (byte[]) voiture[5];
        String image = java.util.Base64.getEncoder().encodeToString(imageBytes);

        session.setAttribute("nbrPlaces", (int)voiture[0]);
        session.setAttribute("prix", (double)voiture[1]);
        session.setAttribute("moteurType", (Voiture.MoteurEnum)voiture[2]);
        session.setAttribute("marque", (String)voiture[3]);
        session.setAttribute("modele", (String)voiture[4]);
        session.setAttribute("image", image);
        session.setAttribute("matricule", matricule);

        getServletContext().getRequestDispatcher("/carDetails.jsp").forward(req, resp);
    }

    public void destroy() {
    }
}

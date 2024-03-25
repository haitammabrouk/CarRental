package com.example.demo4.controllers;

import com.example.demo4.repository.DBManager;
import jakarta.persistence.Query;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "carListServlet", value = "/car-list-servlet")
public class DisplayCarListServlet extends HttpServlet {


    public HttpSession session;

    private DBManager manager = DBManager.getInstance();


    private String message;

    public void init() {
        message = "Hello World!";
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        session = req.getSession();

        String marque = req.getParameter("marque");
        String modele = req.getParameter("modele");
        String dateDebut = req.getParameter("date_debut");
        String dateFin = req.getParameter("date_fin");

        session.setAttribute("dateDebut", dateDebut);
        session.setAttribute("dateFin", dateFin);


        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date selectedDateFin = null;
        Date selectedDateDebut = null;

        try {
            selectedDateFin = dateFormat.parse(dateFin);
            selectedDateDebut = dateFormat.parse(dateDebut);
            session.setAttribute("selectedDateDebut", selectedDateDebut);
            session.setAttribute("selectedDateFin", selectedDateFin);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String jpql = "SELECT DISTINCT v.matricule, v.image, v.prix, m.nom_marque, mo.nom_modele\n" +
                "FROM Voiture v\n" +
                "LEFT JOIN v.reservations r\n" +
                "INNER JOIN v.marque m\n" +
                "INNER JOIN m.modeles mo\n" +
                "WHERE m.nom_marque = :marque AND mo.nom_modele = :modele\n"
                +"AND (r.date_fin < :dateDebut OR r.date_debut > :dateFin OR (r.date_fin is null AND r.date_debut is null))";

        Query query = manager.entity.createQuery(jpql);
        query.setParameter("marque", marque);
        query.setParameter("modele", modele);
        query.setParameter("dateDebut", selectedDateDebut);
        query.setParameter("dateFin", selectedDateFin);

        List<Object[]> cars = query.getResultList();

        session.setAttribute("cars", cars);

        getServletContext().getRequestDispatcher("/carsList.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    public void destroy() {
    }
}

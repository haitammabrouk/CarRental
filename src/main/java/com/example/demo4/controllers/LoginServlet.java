package com.example.demo4.controllers;

import java.io.*;
import java.sql.SQLException;
import java.util.List;

import com.example.demo4.dao.ClientDao;
import com.example.demo4.dao.MarqueDao;
import com.example.demo4.dao.ModeleDao;
import com.example.demo4.dao.PersonnelDao;
import com.example.demo4.entities.Client;
import com.example.demo4.entities.Marque;
import com.example.demo4.entities.Modele;
import com.example.demo4.entities.Personnel;
import jakarta.persistence.Query;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {

    private ClientDao clientDao = ClientDao.getInstance();
    private MarqueDao marqueDAO = MarqueDao.getInstance();
    private ModeleDao modeleDAO = ModeleDao.getInstance();

    private PersonnelDao personnelDao = PersonnelDao.getInstance();

    public HttpSession session;


    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        session = req.getSession();

        try {

            Client client = clientDao.findClientByEmailAndPassword(email, password);
            Personnel personnel = PersonnelDao.getInstance().findPersonnelByEmailAndPassword(email, password);

            if(client != null){
                session.setAttribute("id", client.getCin());
                session.setAttribute("nom", client.getNom());
                session.setAttribute("prenom", client.getPrenom());
                session.setAttribute("email", client.getEmail());
            } else if (personnel != null) {
                session.setAttribute("id", personnel.getCin());
                session.setAttribute("nom", personnel.getNom());
                session.setAttribute("prenom", personnel.getPrenom());
                session.setAttribute("email", personnel.getEmail());
            }else{
                System.out.println("There is no client or personnel");
            }

        }catch (SQLException e){
            System.out.println("Error Has occured while retrieving client by Email and Password !");
        }

        if(clientDao.authenticate(email, password)){
            getServletContext().getRequestDispatcher("/homepage.jsp").forward(req, resp);
        }else if(personnelDao.authenticate(email, password)){
            getServletContext().getRequestDispatcher("/Ajouter_voiture.jsp").forward(req, resp);
        }else{
            req.setAttribute("error", "Email or Password are not Valid !");
            getServletContext().getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }

    public void destroy() {
    }
}

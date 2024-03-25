package com.example.demo4.controllers;

import com.example.demo4.dao.ClientDao;
import com.example.demo4.entities.Client;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "registrationServlet", value = "/registration-servlet")
public class RegistrationServlet extends HttpServlet {

    private ClientDao clientDao = ClientDao.getInstance();

    public HttpSession session;


    private String message;

    public void init() {
        message = "Hello World!";
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String cin = req.getParameter("cin");
        String nom = req.getParameter("nom");
        String prenom = req.getParameter("prenom");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmedPassword = req.getParameter("password-confirmed");

        if(!clientDao.checkPasswordValidationValidity(password, confirmedPassword)){
            req.setAttribute("error", "Password doesnt Match");
        }
        if(clientDao.checkEmailAlreadyExist(email)){
            req.setAttribute("error", "Email already Exist");
        }
        if(clientDao.checkCINAlreadyExist(cin)){
            req.setAttribute("error", "CIN does already Exist");
        }
        if(!clientDao.checkEmailAlreadyExist(email) && clientDao.checkPasswordValidationValidity(password, confirmedPassword) && !clientDao.checkCINAlreadyExist(cin)){
            Client client = new Client();

            client.setCin(cin);
            client.setNom(nom);
            client.setPrenom(prenom);
            client.setEmail(email);
            client.setPassword(password);

            clientDao.addClient(client);

            req.setAttribute("success", "Account has been Created Successfully");
        }

        getServletContext().getRequestDispatcher("/registration.jsp").forward(req, resp);
    }

    public void destroy() {
    }
}

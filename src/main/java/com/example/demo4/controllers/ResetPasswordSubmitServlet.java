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
import java.sql.SQLException;

@WebServlet(name = "resetPasswordSubmitServlet", value = "/reset-password-submit-servlet")
public class ResetPasswordSubmitServlet extends HttpServlet {
    private ClientDao clientDao = ClientDao.getInstance();

    public HttpSession session;


    private String message;

    public void init() {
        message = "Hello World!";
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        session = req.getSession();
        String password = req.getParameter("password");
        String confirmedPassword = req.getParameter("confirmed-password");
        String token = req.getParameter("token");
        Client client = clientDao.findClientByToken(token);

        System.out.println(client.getToken());

        if(clientDao.checkPasswordValidationValidity(password, confirmedPassword)){
            if(client !=null && clientDao.isTokenValid(client.getExpirationToken())){
                client.setPassword(password);
                client.setToken(null);
                client.setExpirationToken(null);
                try{
                    clientDao.updateClient(client.getCin(), client.getNom(), client.getPrenom(), client.getEmail(), client.getPassword(), client.getToken(), client.getExpirationToken());
                }catch(SQLException e){
                    e.printStackTrace();
                }
            }
        }
        System.out.println("Password has been reset succesfully");
        req.setAttribute("success", "Password has been reset succesfully");
        getServletContext().getRequestDispatcher("/resetPassword.jsp").forward(req, resp);
    }

    public void destroy() {
    }
}

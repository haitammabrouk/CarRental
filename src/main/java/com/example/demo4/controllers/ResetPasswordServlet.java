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

@WebServlet(name = "resetPasswordServlet", value = "/reset-password-servlet")
public class ResetPasswordServlet extends HttpServlet {

    private ClientDao clientDao = ClientDao.getInstance();

    public HttpSession session;


    private String message;

    public void init() {
        message = "Hello World!";
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        session = req.getSession();

        String token = req.getParameter("token");

        Client client = clientDao.findClientByToken(token);

        if(client != null && clientDao.isTokenValid(client.getExpirationToken())){
            session.setAttribute("token", token);

            getServletContext().getRequestDispatcher("/resetPassword.jsp").forward(req, resp);
        }else{
            System.out.println("token is invalid or expired");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    public void destroy() {
    }
}

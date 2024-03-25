package com.example.demo4.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/Afficher_details_paiement")

public class Afficher_details_paiement_Servlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

         String cni = request.getParameter("cni");
        String num_carte = request.getParameter("num_carte");

        String expiry = request.getParameter("expiry");

        String num_ver = request.getParameter("num_ver");

        request.setAttribute("cni", cni);
        request.setAttribute("num_carte", num_carte);
        request.setAttribute("expiry", expiry);
        request.setAttribute("num_ver", num_ver);

        request.getRequestDispatcher("/Détails_paiement.jsp").forward(request, response);





    }
}
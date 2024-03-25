package com.example.demo4.controllers;
import com.example.demo4.dao.VoitureDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/afficherVoitures")
public class AfficherVoitureServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VoitureDao voitureDao = VoitureDao.getInstance();
        List<Object[]> voitures = voitureDao.getAllVoitures();

        request.setAttribute("voitures", voitures);

      request.getRequestDispatcher("voitures.jsp").forward(request, response);

    }
}

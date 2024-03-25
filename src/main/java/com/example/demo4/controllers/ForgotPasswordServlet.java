package com.example.demo4.controllers;

import com.example.demo4.dao.ClientDao;
import com.example.demo4.entities.Client;
import com.example.demo4.repository.DBManager;
import jakarta.persistence.Query;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

@WebServlet(name = "forgotPasswordServlet", value = "/forgot-password-servlet")
public class ForgotPasswordServlet extends HttpServlet {

    public HttpSession session;

    private ClientDao clientDAO = ClientDao.getInstance();

    private DBManager manager = DBManager.getInstance();
    private String message;

    public void init() {
        message = "Hello World!";
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        session = req.getSession();

        String email = req.getParameter("email");

        String token = null;

        Client client = clientDAO.findClientByEmail(email);

        if(client != null){
            token = clientDAO.generateEtudiantToken();
            client.setToken(token);
            client.setExpirationToken(clientDAO.calculateExpirationDate());
            try{
                clientDAO.updateClient(client.getCin(), client.getNom(), client.getPrenom(), client.getEmail(), client.getPassword(), client.getToken(), client.getExpirationToken());
            }catch (SQLException ex){
                ex.printStackTrace();
            }
        }

        try{
            sendResetEmail(client.getEmail(), token);
        }catch(MessagingException e){
            e.printStackTrace();
        }
        session.setAttribute("token", token);
        getServletContext().getRequestDispatcher("/emailSent.jsp").forward(req, resp);
    }

    private void sendResetEmail(String toEmail, String token) throws MessagingException{
        String myEmail = "haitammk0708@gmail.com";
        String myPassword = "ijdycwusscblknrr";

        Properties props = new Properties();

        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.debug", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myEmail, myPassword);
            }
        });

        try{
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Réinitialisation du mot de passe");
            message.setText("Cliquez sur le lien suivant pour réinitialiser votre mot de passe : "
                    + "http://localhost:8080/demo4_war/reset-password-servlet?token=" + token);

            Transport.send(message);

            System.out.println("E-mail de réinitialisation envoyé avec succès.");
        }catch (MessagingException e){
            e.printStackTrace();
            System.out.println("some issues has been encountered when messaging");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    public void destroy() {
    }
}

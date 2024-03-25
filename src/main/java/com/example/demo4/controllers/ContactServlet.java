package com.example.demo4.controllers;

import com.example.demo4.repository.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Properties;

@WebServlet(name = "contactServlet", value = "/contact-servlet")
public class ContactServlet extends HttpServlet {

    public HttpSession session;

    private DBManager manager = DBManager.getInstance();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String nom = req.getParameter("nom");
        String email = req.getParameter("email");
        String message = req.getParameter("message");

        try {
            sendResetEmail(nom, email, message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("success", "Your message has been sent succesfully");
        getServletContext().getRequestDispatcher("/contact.jsp").forward(req, resp);

    }

    private void sendResetEmail(String nom, String email, String msg) throws MessagingException {
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
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("meriemfattah4@gmail.com"));
            message.setSubject("Contact");
            message.setText("Hello, je suis : " + nom + " voici mon message : "+msg+" et voici mon email : "+email);

            Transport.send(message);


        }catch (MessagingException e){
            e.printStackTrace();
            System.out.println("some issues has been encountered when messaging");
        }
    }
}

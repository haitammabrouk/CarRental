<%@ page import="com.example.demo4.entities.Voiture" %><%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 18/11/2023
  Time: 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Voiture voiture = (Voiture) session.getAttribute("voiture");

    String image = java.util.Base64.getEncoder().encodeToString(voiture.getImage());
%>
<html>
<head>
</head>
<body>
matricule : ${voiture.getMatricule()}
marque : ${voiture.getMarque()}
image :<img src="data:image/jpeg;base64,<%=image%>" alt="">
</body>
</html>

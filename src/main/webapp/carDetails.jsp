<%@ page import="com.example.demo4.entities.Voiture" %><%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 10/11/2023
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Details</title>
    <%@ include file = "setup.jsp" %>
</head>
<%
    String cin = (String)session.getAttribute("id");
    String nom = (String)session.getAttribute("nom");
    String prenom = (String)session.getAttribute("prenom");
    %>
<% if(cin == null){
    %>
<jsp:forward page="login.jsp"></jsp:forward>
<%
} %>
    <%
    if(cin == null){

    }

    String matricule = (String) session.getAttribute("matricule");
    int nbrPlaces = (int)session.getAttribute("nbrPlaces");
    double prix = (double) session.getAttribute("prix");
    String marque = (String)session.getAttribute("marque");
    String modele = (String) session.getAttribute("modele");
    Voiture.MoteurEnum moteurType = (Voiture.MoteurEnum) session.getAttribute("moteurType");
    String image = (String) session.getAttribute("image");
%>
<body>
<div class="car-details-page">
    <% if(cin == null){
    %> <jsp:include page = "navbar.jsp" />
    <%} else { %>
    <jsp:include page = "secondnavbar.jsp" />
    <%} %>
    <div class="car-details-page-content font-poppin mt-6">
        <h1 class="text-sm font-bold text-[#3C763D] bg-[#DFF0D8] pl-4 py-3 rounded-lg mx-28 ">Annulation gratuite avant la prise en charge du véhicule</h1>
        <div class="sections flex justify-around items-center pt-4">
            <div class="first-section">
                <h1 class="text-3xl text-[#275771]"><%=marque%> <%=modele%></h1>
                <p class="text-xs pt-2">
                    <svg class="inline" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48H48zM0 176V384c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V176L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z"/></svg>
                    <span>Vous pouvez aussi nous contacter par e-mail : carrentalmaroc@company.com</span>
                </p>
                <div class="car-img pt-6">
                    <img class="h-56 w-12/12" src="data:image/jpeg;base64,<%=image%>" alt="">
                </div>
                <div class="attributes flex justify-around text-sm pt-3">
                    <div class="attribute flex flex-col items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M112 48a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm40 304V480c0 17.7-14.3 32-32 32s-32-14.3-32-32V256.9L59.4 304.5c-9.1 15.1-28.8 20-43.9 10.9s-20-28.8-10.9-43.9l58.3-97c17.4-28.9 48.6-46.6 82.3-46.6h29.7c33.7 0 64.9 17.7 82.3 46.6l58.3 97c9.1 15.1 4.2 34.8-10.9 43.9s-34.8 4.2-43.9-10.9L232 256.9V480c0 17.7-14.3 32-32 32s-32-14.3-32-32V352H152z"/></svg>
                        <span><%=nbrPlaces%> personnes</span>
                    </div>
                    <div class="attribute flex flex-col items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M174.7 45.1C192.2 17 223 0 256 0s63.8 17 81.3 45.1l38.6 61.7 27-15.6c8.4-4.9 18.9-4.2 26.6 1.7s11.1 15.9 8.6 25.3l-23.4 87.4c-3.4 12.8-16.6 20.4-29.4 17l-87.4-23.4c-9.4-2.5-16.3-10.4-17.6-20s3.4-19.1 11.8-23.9l28.4-16.4L283 79c-5.8-9.3-16-15-27-15s-21.2 5.7-27 15l-17.5 28c-9.2 14.8-28.6 19.5-43.6 10.5c-15.3-9.2-20.2-29.2-10.7-44.4l17.5-28zM429.5 251.9c15-9 34.4-4.3 43.6 10.5l24.4 39.1c9.4 15.1 14.4 32.4 14.6 50.2c.3 53.1-42.7 96.4-95.8 96.4L320 448v32c0 9.7-5.8 18.5-14.8 22.2s-19.3 1.7-26.2-5.2l-64-64c-9.4-9.4-9.4-24.6 0-33.9l64-64c6.9-6.9 17.2-8.9 26.2-5.2s14.8 12.5 14.8 22.2v32l96.2 0c17.6 0 31.9-14.4 31.8-32c0-5.9-1.7-11.7-4.8-16.7l-24.4-39.1c-9.5-15.2-4.7-35.2 10.7-44.4zm-364.6-31L36 204.2c-8.4-4.9-13.1-14.3-11.8-23.9s8.2-17.5 17.6-20l87.4-23.4c12.8-3.4 26 4.2 29.4 17L182 241.2c2.5 9.4-.9 19.3-8.6 25.3s-18.2 6.6-26.6 1.7l-26.5-15.3L68.8 335.3c-3.1 5-4.8 10.8-4.8 16.7c-.1 17.6 14.2 32 31.8 32l32.2 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-32.2 0C42.7 448-.3 404.8 0 351.6c.1-17.8 5.1-35.1 14.6-50.2l50.3-80.5z"/></svg>
                        <span>climatisation</span>
                    </div>
                    <div class="attribute flex flex-col items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M96 0C82.7 0 72 10.7 72 24s10.7 24 24 24c4.4 0 8 3.6 8 8v64.9c0 12.2-7.2 23.1-17.2 30.1C53.7 174.1 32 212.5 32 256V448c0 35.3 28.7 64 64 64H224c35.3 0 64-28.7 64-64V256c0-43.5-21.7-81.9-54.8-105c-10-7-17.2-17.9-17.2-30.1V56c0-4.4 3.6-8 8-8c13.3 0 24-10.7 24-24s-10.7-24-24-24l-8 0 0 0 0 0H104l0 0 0 0L96 0zm64 382c-26.5 0-48-20.1-48-45c0-16.8 22.1-48.1 36.3-66.4c6-7.8 17.5-7.8 23.5 0C185.9 288.9 208 320.2 208 337c0 24.9-21.5 45-48 45z"/></svg>
                        <span><%=moteurType%></span>
                    </div>
                </div>
            </div>
            <div class="second-section">
                <div class="text-sm font-semibold flex justify-between border-b border-b-[#B4B4B4]">
                    <p>Prix de voiture(par jour)</p>
                    <p><%=prix%> <span>Dhs</span></p>
                </div>
                <p class="text-sm text-[#BE4746] font-bold my-3">*Presser sur le boutton au dessous pour reserver</p>
                <a href="payment-servlet?id=<%=matricule%>"><button class="text-[#ffffff] bg-[#275771] text-center py-1 cursor-pointer px-2">Je reserve</button></a>
            </div>
        </div>
    </div>
    <footer class="footer w-full h-36 mt-20 bg-[#506078] flex flex-col items-center justify-center overflow-hidden">
        <p class="text-[#C1C3C4] text-sm ">Trouvez une location de voiture pas chère au Maroc avec CarRentalMaroc. notre but est de vous aider à louer une voiture dans le pays (Maroc).</p>
        <p class="text-[#C1C3C4] text-sm">Ce n’est pas ce que vous recherchiez ? Trouvez des milliers des locations de voitures avec CarRentalMaroc.</p>
        <p class="text-[#ffffff] pt-4">Copyright © 2023 CarRentalMaroc Transport Limited. Tous droits réservés.</p>
    </footer>
</div>
</body>
</html>

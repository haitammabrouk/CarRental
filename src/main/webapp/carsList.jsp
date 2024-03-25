<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.example.demo4.entities.Marque" %>
<%@ page import="com.example.demo4.entities.Modele" %>
<%@ page import="com.example.demo4.dao.MarqueDao" %>
<%@ page import="com.example.demo4.dao.ModeleDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste Des Voitures Dispo</title>
    <%@ include file = "setup.jsp" %>
</head>
<%
    List<Object[]> cars = (List<Object[]>)session.getAttribute("cars");

    String cin = (String)session.getAttribute("id");
    String nom = (String)session.getAttribute("nom");
    String prenom = (String)session.getAttribute("prenom");

    MarqueDao marqueDAO = MarqueDao.getInstance();
    ModeleDao modeleDAO = ModeleDao.getInstance();

    List<Marque> marques = marqueDAO.returnMarques();
    List<Modele> modeles = modeleDAO.returnModeles();
    %>

<body>
<div class="cars-list-page font-poppin">
    <% if(cin == null){
    %> <jsp:include page = "navbar.jsp" />
    <%} else { %>
    <jsp:include page = "secondnavbar.jsp" />
    <%} %>
    <div class="flex justify-around">
        <section class="first-section flex justify-around pt-14">
            <div class="first-section-content">
                <h1 class="text-3xl text-[#4262DA] pb-4">RÉSERVATION</h1>
                <form class="border border-[#4262DA] rounded-sm px-6 py-2" action="car-list-servlet" method="post">
                    <h3 class="text-xl font-semibold text-[#4262DA] pt-3 pb-3">Rechercher une voiture</h3>
                    <div class="inputs flex flex-col items-center">
                        <div class="space-y-2">
                            <div class="marque">
                                <label class="block text-sm pb-1" for="marque">Marque :</label>
                                <select class="w-80 border border-[#747373]" name="marque" id="marque">
                                    <% for(Marque marque : marques){
                                    %>
                                    <option value="<%=marque.getNom_marque()%>"><%=marque.getNom_marque()%></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="modele">
                                <label class="block text-sm pb-1" for="modele">Modele :</label>
                                <select class="w-80 border border-[#747373]" name="modele" id="modele">
                                    <% for(Modele modele : modeles){
                                    %>
                                    <option value="<%=modele.getNom_modele()%>"><%=modele.getNom_modele()%></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="flex justify-between">
                                <div class="date-debut">
                                    <label class="block text-sm pb-1" for="debut">Date Debut :</label>
                                    <input class="outline-none border border-[#747373]" type="date" name="date_debut" id="debut">
                                </div>
                                <div class="date-fin">
                                    <label class="block text-sm pb-1" for="fin">Date Fin :</label>
                                    <input class="outline-none border border-[#747373]" type="date" name="date_fin" id="fin">
                                </div>
                            </div>
                        </div>
                        <div class="submit-btn bg-[#4262DA] text-sm py-1 my-4 text-[#ffffff]">
                            <input class="w-80" type="submit" value="Rechercher">
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <section class="second-section mt-28">
            <p class="text-sm text-[#4262DA] border-b border-[#747373]">
                Réservez votre voiture de location en quelques clics seulement (les disponibilités sont en temps réel)
            </p>
            <%
                for(Object[] car : cars){
                    String formattedDateFin = null;

                    String matricule = (String)car[0];

                    byte[] imageBytes = (byte[])car[1];

                    String image = java.util.Base64.getEncoder().encodeToString(imageBytes);

                    double prix = (double)car[2];
                    String marque = (String)car[3];
                    String modele = (String)car[4];

            %>
            <div class="car-card border border-[#747373] cursor-pointer hover:border-[#4262DA] duration-300 shaddow-xl mt-2 py-2 pb-4 flex justify-between">
                <div class="first-section flex flex-col items-center space-y-3">
                    <h1 class="text-[#4262DA] font-semibold text-xl"><%=marque%> <%=modele%></h1>
                    <div class="car-img">
                        <img class="h-24 w-52" src="data:image/jpeg;base64,<%=image%>" alt="">
                    </div>
                </div>
                <div class="second-section flex jusitfy-between pt-3 pr-4">
                    <div class="part-1 pr-10 flex flex-col items-center">
                        <div class="price">
                            <span class="font-bold text-[#4262DA] text-3xl"><%=prix%></span>
                            <p class="inline font-semibold">MAD</p>
                        </div>
                        <div class="desc">
                            <p class="font-semibold">Pour Un jour</p>
                        </div>
                    </div>
                    <div class="part-2 space-y-2">
                        <p class="text-[#168C36] font-semibold text-normal">
                            <svg class="text-[#168C36] text-xl" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M438.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L160 338.7 393.4 105.4c12.5-12.5 32.8-12.5 45.3 0z"/></svg>
                            Annulation Gratuite
                        </p>
                        <a href="car-details-servlet?id=<%=matricule%>"><button class="px-3 py-2 text-[#ffffff] bg-[#4262DA]">Plus de details</button></a>
                        <div class="icons text-xs">
                            <span class="block"><svg class="inline" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M256 32H181.2c-27.1 0-51.3 17.1-60.3 42.6L3.1 407.2C1.1 413 0 419.2 0 425.4C0 455.5 24.5 480 54.6 480H256V416c0-17.7 14.3-32 32-32s32 14.3 32 32v64H521.4c30.2 0 54.6-24.5 54.6-54.6c0-6.2-1.1-12.4-3.1-18.2L455.1 74.6C446 49.1 421.9 32 394.8 32H320V96c0 17.7-14.3 32-32 32s-32-14.3-32-32V32zm64 192v64c0 17.7-14.3 32-32 32s-32-14.3-32-32V224c0-17.7 14.3-32 32-32s32 14.3 32 32z"/></svg><span class="pl-2">Kilometrage Illimite</span></span>

                            <span><svg class="inline" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M64 32C28.7 32 0 60.7 0 96v32H576V96c0-35.3-28.7-64-64-64H64zM576 224H0V416c0 35.3 28.7 64 64 64H512c35.3 0 64-28.7 64-64V224zM112 352h64c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16zm112 16c0-8.8 7.2-16 16-16H368c8.8 0 16 7.2 16 16s-7.2 16-16 16H240c-8.8 0-16-7.2-16-16z"/></svg><span class="pl-2">Compact</span></span>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </section>
    </div>
    <%@ include file = "footer.jsp" %>
</div>
</body>
</html>
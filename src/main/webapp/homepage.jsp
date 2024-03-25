<%@ page language="java" import="jakarta.servlet.http.HttpSession" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.demo4.entities.Marque" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo4.entities.Modele" %>
<%@ page import="com.example.demo4.dao.MarqueDao" %>
<%@ page import="com.example.demo4.dao.ModeleDao" %>
.
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@100;200;300;400;500;600;700;800;900&family=Montserrat:ital,wght@0,500;0,600;0,900;1,700;1,800;1,900&family=Poppins:wght@200;300;400;500;600;700;800&family=Roboto:ital,wght@0,300;0,400;0,700;0,900;1,700&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    width: {
                        'custom': '800px',
                        'short' : '600px',
                        'long' : '900px'
                    },
                    height : {
                        'custom' : '200px',
                    },
                    fontFamily: {
                        'poppin': ['"Poppins"', 'sans-serif'],
                    },
                }
            }
        }
    </script>
</head>
<body>

<%
     String cin = (String)session.getAttribute("id");
     String nom = (String)session.getAttribute("nom");
     String prenom = (String)session.getAttribute("prenom");

     MarqueDao marqueDAO = MarqueDao.getInstance();
     ModeleDao modeleDAO = ModeleDao.getInstance();

    List<Marque> marques = marqueDAO.returnMarques();
    List<Modele> modeles = modeleDAO.returnModeles();
%>

<div id="home" class="home-container font-poppin">
    <% if(cin == null){
        %> <jsp:include page = "navbar.jsp" />
    <%} else { %>
        <jsp:include page = "secondnavbar.jsp" />
    <%} %>
    <div class="content">
        <section class="first-section">
            <div class="first-section-content">
                <div style="background: url(https://www.aircar.ma/img/site/slides/slide-02.webp);
                    background-size: 100%; height: 65%;" class="home-image flex justify-center items-center">
                    <div class="form-consultation">
                        <div class="title">
                            <h2 class="text-2xl text-[#4262DA] font-semibold">Réservez une voiture</h2>
                        </div>
                        <form class="bg-[#ffffff] border-[#ffffff] border-4 rounded-xl bg-opacity-60 h-custom w-custom flex flex-col justify-around" action="car-list-servlet" method="post">
                            <div class=" flex overflow-hidden">
                                <div class="first w-2/4 flex flex-col items-center justify-center">
                                    <div class="pb-2">
                                        <label class="block" for="marque">Marque :</label>
                                        <select class="rounded-lg px-2 w-72" name="marque" id="marque">
                                            <% for(Marque marque : marques){
                                            %>
                                            <option value="<%=marque.getNom_marque()%>"><%=marque.getNom_marque()%></option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div>
                                        <label class="block" for="modele">Modele :</label>
                                        <select class="rounded-lg px-2 w-72" name="modele" id="modele">
                                            <% for(Modele modele : modeles){
                                            %>
                                            <option value="<%=modele.getNom_modele()%>"><%=modele.getNom_modele()%></option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                                <div class="second w-2/4 flex flex-col items-center justify-center">
                                    <div class="pb-2">
                                        <label class="block" for="date_debut">Date Debut :</label>
                                        <input class="rounded-lg px-2 w-72"  id="date_debut" name="date_debut" type="date">
                                    </div>
                                    <div>
                                        <label class="block" for="date_fin">Date Fin :</label>
                                        <input class="rounded-lg px-2 w-72"  id="date_fin" name="date_fin" type="date">
                                    </div>
                                </div>
                            </div>
                            <div class="btn-submit flex justify-center items-center">
                                <input class="bg-[#4262DA] py-2 px-4 rounded-lg text-[#ffffff] cursor-pointer font-normal" type="submit" value="Réserver">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <section class="second-section pt-16 border-b border-[#CBCBCB] pb-14">
            <div class="second-section-content flex flex-col items-center">
                <div class="title">
                    <h2 class="text-[#4262DA] text-2xl font-semibold ">Pourquoi nous choisir?</h2>
                </div>
                <div class="description w-short pt-5">
                    <p class="text-[#595959] text-center">Que vous ayez besoin d’une petite citadine pour vous déplacer facilement en ville, d’un SUV ou d'une élégante berline, CarRentalMaroc répond à toutes attentes par un parc diversifié de véhicules</p>
                </div>
                <div class="traits">
                    <ul class="flex justify-evenly space-x-16 pt-10">
                        <li class="flex flex-col items-center">
                            <svg class="border-2 border-[#4262DA] rounded-full text-[#ffffff] px-2 py-2 w-28 h-28" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M312 24V34.5c6.4 1.2 12.6 2.7 18.2 4.2c12.8 3.4 20.4 16.6 17 29.4s-16.6 20.4-29.4 17c-10.9-2.9-21.1-4.9-30.2-5c-7.3-.1-14.7 1.7-19.4 4.4c-2.1 1.3-3.1 2.4-3.5 3c-.3 .5-.7 1.2-.7 2.8c0 .3 0 .5 0 .6c.2 .2 .9 1.2 3.3 2.6c5.8 3.5 14.4 6.2 27.4 10.1l.9 .3c11.1 3.3 25.9 7.8 37.9 15.3c13.7 8.6 26.1 22.9 26.4 44.9c.3 22.5-11.4 38.9-26.7 48.5c-6.7 4.1-13.9 7-21.3 8.8V232c0 13.3-10.7 24-24 24s-24-10.7-24-24V220.6c-9.5-2.3-18.2-5.3-25.6-7.8c-2.1-.7-4.1-1.4-6-2c-12.6-4.2-19.4-17.8-15.2-30.4s17.8-19.4 30.4-15.2c2.6 .9 5 1.7 7.3 2.5c13.6 4.6 23.4 7.9 33.9 8.3c8 .3 15.1-1.6 19.2-4.1c1.9-1.2 2.8-2.2 3.2-2.9c.4-.6 .9-1.8 .8-4.1l0-.2c0-1 0-2.1-4-4.6c-5.7-3.6-14.3-6.4-27.1-10.3l-1.9-.6c-10.8-3.2-25-7.5-36.4-14.4c-13.5-8.1-26.5-22-26.6-44.1c-.1-22.9 12.9-38.6 27.7-47.4c6.4-3.8 13.3-6.4 20.2-8.2V24c0-13.3 10.7-24 24-24s24 10.7 24 24zM568.2 336.3c13.1 17.8 9.3 42.8-8.5 55.9L433.1 485.5c-23.4 17.2-51.6 26.5-80.7 26.5H192 32c-17.7 0-32-14.3-32-32V416c0-17.7 14.3-32 32-32H68.8l44.9-36c22.7-18.2 50.9-28 80-28H272h16 64c17.7 0 32 14.3 32 32s-14.3 32-32 32H288 272c-8.8 0-16 7.2-16 16s7.2 16 16 16H392.6l119.7-88.2c17.8-13.1 42.8-9.3 55.9 8.5zM193.6 384l0 0-.9 0c.3 0 .6 0 .9 0z"/></svg>
                            <div class="card-1 text-center pt-4">
                                <h1 class="font-semibold">
                                    Nos tarifs
                                </h1>
                                <p class="w-44 text-sm">
                                    Nos prix sont compétitifs et avantageux.
                                </p>
                            </div>
                        </li>
                        <li class="flex flex-col items-center">
                            <svg class="border-2 border-[#4262DA] rounded-full text-[#ffffff] px-4 py-4 w-28 h-28" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3zM625 177L497 305c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L591 143c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/></svg>
                            <div class="card-1 text-center pt-4">
                                <h1 class="font-semibold">
                                    Disponibilité
                                </h1>
                                <p class="w-44 text-sm">
                                    Vous pouvez réserver à tout moment.
                                </p>
                            </div>
                        </li>
                        <li class="flex flex-col items-center">
                            <svg class="border-2 border-[#4262DA] rounded-full text-[#ffffff] px-4 py-4 w-28 h-28" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M190.5 68.8L225.3 128H224 152c-22.1 0-40-17.9-40-40s17.9-40 40-40h2.2c14.9 0 28.8 7.9 36.3 20.8zM64 88c0 14.4 3.5 28 9.6 40H32c-17.7 0-32 14.3-32 32v64c0 17.7 14.3 32 32 32H480c17.7 0 32-14.3 32-32V160c0-17.7-14.3-32-32-32H438.4c6.1-12 9.6-25.6 9.6-40c0-48.6-39.4-88-88-88h-2.2c-31.9 0-61.5 16.9-77.7 44.4L256 85.5l-24.1-41C215.7 16.9 186.1 0 154.2 0H152C103.4 0 64 39.4 64 88zm336 0c0 22.1-17.9 40-40 40H288h-1.3l34.8-59.2C329.1 55.9 342.9 48 357.8 48H360c22.1 0 40 17.9 40 40zM32 288V464c0 26.5 21.5 48 48 48H224V288H32zM288 512H432c26.5 0 48-21.5 48-48V288H288V512z"/></svg>
                            <div class="card-1 text-center pt-4">
                                <h1 class="font-semibold">
                                    Notre offre
                                </h1>
                                <p class="w-44 text-sm">
                                    Nos véhicules sont diversifiés et adaptés à vos besoins.
                                </p>
                            </div>
                        </li>
                        <li class="flex flex-col items-center">
                            <svg class="border-2 border-[#4262DA] rounded-full text-[#ffffff] px-4 py-4 w-28 h-28" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M224 32H64C46.3 32 32 46.3 32 64v64c0 17.7 14.3 32 32 32H441.4c4.2 0 8.3-1.7 11.3-4.7l48-48c6.2-6.2 6.2-16.4 0-22.6l-48-48c-3-3-7.1-4.7-11.3-4.7H288c0-17.7-14.3-32-32-32s-32 14.3-32 32zM480 256c0-17.7-14.3-32-32-32H288V192H224v32H70.6c-4.2 0-8.3 1.7-11.3 4.7l-48 48c-6.2 6.2-6.2 16.4 0 22.6l48 48c3 3 7.1 4.7 11.3 4.7H448c17.7 0 32-14.3 32-32V256zM288 480V384H224v96c0 17.7 14.3 32 32 32s32-14.3 32-32z"/></svg>
                            <div class="card-1 text-center pt-4">
                                <h1 class="font-semibold">
                                    Flexibilité
                                </h1>
                                <p class="w-44 text-sm">
                                    Choisissez en toute liberté Quand et Où vous voulez louer
                                </p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

        </section>
        <section class="third-section pt-16 border-b border-[#CBCBCB] pb-14">
            <div class="third-section-content flex flex-col items-center">
                <div class="title">
                    <h2 class="text-[#4262DA] text-2xl font-semibold ">Location simple et abordable</h2>
                </div>
                <div class="description w-short pt-5">
                    <h2 class="text-left">Avec plus de 10 ans d’expérience, CarRentalMaroc est un des principaux loueur de voitures au Maroc</h2>
                    <p class="text-[#595959] text-sm pt-4 text-left w-4/5">CarRentalMaroc vous permet de profiter de locations :</p>
                    <ul class="text-sm pl-10 pt-5" style="list-style-type:circle">
                        <li>Aux prix compétitifs et bien étudiés</li>
                        <li>Adaptés aux différents budgets</li>
                        <li>Pour particuliers et professionnels</li>
                        <li>Pour tout type d'usage</li>
                    </ul>
                </div>

                <div class="title pt-10">
                    <h2 class="text-[#4262DA]  font-semibold ">Comment louer une voiture?</h2>
                </div>
                <div class="description w-short pt-3">
                    <ul class="text-sm flex space-x-6 justify-around pl-10 pt-5">
                        <li>
                            <h2 class="font-semibold">1 – Renseignez la date</h2>
                            <p class="w-60 text-sm">Entez le créneau auquels vous souhaitez prendre/rendre votre voiture</p>
                        </li>
                        <li>
                            <h2 class="font-semibold">2 – Choisissez votre voiture</h2>
                            <p class="w-60 text-sm">Faites votre choix en indiquant vos préférences ; les disponibilités sont en temps réel !</p>
                        </li>
                        <li>
                            <h2 class="font-semibold">3 – Valider le paiement</h2>
                            <p class="w-60 text-sm">Entrez les informations nécessaires et effectuez votre paiement en ligne</p>
                        </li>
                        <li>
                            <h2 class="font-semibold">4 – Votre voiture est prête</h2>
                            <p class="w-60 text-sm">Félicitations ! Vous n’avez qu’à récupérer vos clés maintenant après passage à l’agence !</p>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <div class="forth-section pt-16 pb-14">
            <div class="forth-section-content flex flex-col items-center">
                <div class="second-section-content flex flex-col items-center">
                    <div class="title">
                        <h2 class="text-[#4262DA] text-2xl font-semibold ">A savoir avant de louer une voiture au Maroc</h2>
                    </div>
                    <div class="description w-short pt-5">
                        <p class="text-[#595959] text-center">CarRentalMaroc vous partage 5 conseils incontournables à suivre pour une meilleure expérience de location de voiture au Maroc.</p>
                    </div>
                    <div class="steps pt-8">
                        <ul class="space-y-4">
                            <li class="text-left">
                                <h2 class="font-semibold">
                                    Conseil 1 : Penser à réserver tôt !
                                </h2>
                                <p class="w-60 text-sm w-long">Réserver tôt permet souvent d’avoir les meilleurs prix, et un plus large choix de catégories de voitures disponibles à la location...</p>
                            </li>
                            <li>
                                <h2 class="font-semibold">Conseil 2 : Vos documents</h2>
                                <p class="w-60 text-sm w-long">Assurez-vous que votre permis de conduire est bien valable, ainsi que vos autres documents de voyages, nous vous recommandons également de vous assurer que votre carte de crédit permet le blocage du déposit de votre location.</p>
                            </li>
                            <li>
                                <h2 class="font-semibold">Conseil 3 : Le contrat !</h2>
                                <p class="w-60 text-sm w-long">Pensez à lire attentivement le contrat, et n’hésitez pas à demander des explications sur votre location, assurez-vous que tous les conducteurs de la voiture prévus dans votre réservation figurent sur le contrat et que leurs permis de conduire sont bien valables.</p>
                            </li>
                            <li>
                                <h2 class="font-semibold">Conseil 4 : Être ponctuel</h2>
                                <p class="w-60 text-sm w-long">l est très important de respecter les durées de locations d’un véhicule ! Votre véhicule sera réservé par un autre client le jour de votre retour .</p>
                            </li>
                            <li>
                                <h2 class="font-semibold">
                                    Conseil 5 : Territorialité
                                </h2>
                                <p class="w-60 text-sm w-long">Les locations de voitures d'CarRentalMaroc Maroc ne pourront circuler qu'à l’intérieur du Royaume du Maroc.</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file = "footer.jsp" %>
    </div>
</body>
</html>
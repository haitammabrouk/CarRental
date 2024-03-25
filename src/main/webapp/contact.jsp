<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Contact</title>
    <%@ include file = "setup.jsp" %>
</head>
<body>
<%
    String cin = (String)session.getAttribute("id");
    String nom = (String)session.getAttribute("nom");
    String prenom = (String)session.getAttribute("prenom");
%>

<% if(cin == null){
%> <jsp:include page = "navbar.jsp" />
<%} else { %>
<jsp:include page = "secondnavbar.jsp" />
<%} %>
<div class="container w-full h-screen flex font-poppin ">
    <div class="flex flex-col mt-24 items-center pl-20  space-y-4  w-3/4  " >
        <h1 class="font-bold text-[#4262DA]">CONTACTEZ-NOUS!</h1>
        <p >Pour toutes questions relatives à votre réservation en ligne ,
            contactez notre Service clients .</p>
        <form method="post" action="contact-servlet">
        <div class="flex space-x-8  ">
            <label class="mt-8" for="nom">Nom complet<span class=" ml-2 text-red-500 font-bold text-xl ">*</span></label>
            <input  type="text" name="nom" id="nom" class="px-2 py-1 outline-none mt-8 border-2  hover:rounded-xl " placeholder="Nom complet">
            <label  class="mt-8"  for="email">E-mail<span class=" ml-2 text-red-500 font-bold text-xl ">*</span></label>
            <input  type="email" name="email" id="email" class="px-2 py-1 outline-none mt-8 border-2 hover:rounded-xl  rounded" placeholder="E-mail">
        </div>
        <div>
            <label class="block" for="message">Message<span class="ml-2 text-red-500 font-bold text-xl">*</span></label>
            <textarea id="message" name="message" rows="4" cols="88" class=" outline-none px-2 border-2 rounded mt-2 hover:rounded-xl" placeholder="Message"></textarea>
        </div>
        <button  class="px-2 py-1 rounded border-2  hover:rounded-xl hover:font-bold hover:text-white hover:bg-[#4262DA]  " type="submit">Envoyer</button>
            <p class="text-sm text-[#53976A]">${success}</p>
        </form>
    </div>
    <div class="border-l-2 mt-40 h-1/2  ">
        <div class=" py-10 px-8  space-y-8">
            <div class="space-y-2">
                <h2 class="font-bold text-[#4262DA]">Téléphone</h2>
                <p>+ 212 (0) 5 28 21 91 68</p>
            </div>
            <div class="space-y-2">
                <h3  class="font-bold text-[#4262DA]">Adresse</h3>
                <p>Casablanca - Centre Ville</p>
                <p> 48 Boulevard d'ANFA </p>
            </div>
        </div>
    </div>
</div>
<%@ include file = "footer.jsp" %>
</body>
</html>
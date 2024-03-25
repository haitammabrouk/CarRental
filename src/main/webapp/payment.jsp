<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
    String cin = (String)session.getAttribute("id");
    String nom = (String)session.getAttribute("nom");
    String prenom = (String)session.getAttribute("prenom");
    %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <%@ include file = "setup.jsp" %>
</head>
<body>
<div class="payment-page">
    <% if(cin == null){
    %> <jsp:include page = "navbar.jsp" />
    <%} else { %>
    <jsp:include page = "secondnavbar.jsp" />
    <%} %>
    <div class="payment-page-content font-poppin flex flex-col items-center space-y-10 mt-14">
        <div class="title flex flex-col items-center">
            <p class="text-3xl font-semibold">Settings</p>
            <p class="underline underline-offset-2">Payment</p>
        </div>
        <div class="sections flex items-center space-x-16">
            <section class="first-section">
                <p class="text-sm font-normal">Afin de valider votre réservation, il est nécessaire d'effectuer le paiement en ligne.</p>
                <p class="font-bold text-[#BE4746]">*VOTRE RÉSERVATION NE SERA PAS VALIDE SANS LE PAIEMENT!</p>
                <img class="h-14 w-52" src="assets/visa-and-mastercard-logo-26.png" alt="">
            </section>
            <section class="second-section border-l border-[#B4B4B4] pl-14">
                <form for class="space-y-2" action="payment-servlet" method="post">
                    <div class="card-number">
                        <label for="card_number">
                            Numero Du carte :
                        </label>
                        <input class="block pl-2 outline-none border border-[#B4B4B4] w-96" placeholder="XXXX XXXX XXXX XXXX" type="text" id="card_number" name="card_number">
                    </div>
                    <div class="expiration">
                        <label for="expiration">
                            Expiration :
                        </label>
                        <input class="block pl-2 outline-none border border-[#B4B4B4] w-96" placeholder="MM / YY" type="text" id="expiration" name="expiration">
                    </div>
                    <div class="card-verification">
                        <label for="verification">
                            Numero De verification :
                        </label>
                        <input class="block pl-2 outline-none border border-[#B4B4B4] w-96" placeholder="CVC" type="text" id="verification" name="verification">
                    </div>
                    <input type="submit" class="text-[#ffffff] bg-[#275771] text-center py-1 px-4" value="Soumettre"/>
                    </form>
            </section>
        </div>
    </div>
    <%@ include file = "footer.jsp" %>
</div>
</body>
</html>
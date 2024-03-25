<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%
    String cin = (String)session.getAttribute("id");
    String nom = (String) session.getAttribute("nom");
    String prenom = (String) session.getAttribute("prenom");
    String dateDebut =(String) session.getAttribute("dateDebut");
    String dateFin = (String) session.getAttribute("dateFin");
    double total = (double) session.getAttribute("total");
    String email = (String) session.getAttribute("email");
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Confimed</title>
    <%@ include file = "setup.jsp" %>
</head>
<body>
<div class="payment-confirmation">
    <% if(cin == null){
    %> <jsp:include page = "navbar.jsp" />
    <%} else { %>
    <jsp:include page = "secondnavbar.jsp" />
    <%} %>
    <div class="payment-confirmation-content font-poppin flex flex-col justify-center pt-10">
        <div class="line text-sm border-b-2 flex space-x-4 py-3 mx-44">
            <div>
                <svg class="inline" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48H48zM0 176V384c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V176L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z"/></svg>
                <span>carrentalmaroc@company.com</span>
            </div>
            <div>
                <svg class="inline" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M164.9 24.6c-7.7-18.6-28-28.5-47.4-23.2l-88 24C12.1 30.2 0 46 0 64C0 311.4 200.6 512 448 512c18 0 33.8-12.1 38.6-29.5l24-88c5.3-19.4-4.6-39.7-23.2-47.4l-96-40c-16.3-6.8-35.2-2.1-46.3 11.6L304.7 368C234.3 334.7 177.3 277.7 144 207.3L193.3 167c13.7-11.2 18.4-30 11.6-46.3l-40-96z"/></svg>
                <span>+212 0 00 00 00 00</span>
            </div>
        </div>
        <div class="parts space-y-10 flex flex-col mx-44">
            <div class="part-1 pt-8">
                <h2 class="text-xl pb-1">Détails De Réservation</h2>
                <div class="flex space-x-20">
                    <div class="text-[#6a6b6b]">
                        <p>Check in :</p>
                        <p>Check out :</p>
                    </div>
                    <div>
                        <p><%=dateDebut%></p>
                        <p><%=dateFin%></p>
                    </div>
                </div>
            </div>
            <div class="part-2">
                <h2 class="text-xl pb-1">Réservé Par</h2>
                <div class="flex justify-between">
                    <div class="text-[#6a6b6b]">
                        <p><%=nom%> <%=prenom%></p>
                        <p><%=email%></p>
                        <p>+212 9 56 77 87 67</p>
                    </div>
                </div>
            </div>
            <div class="part-3">
                <div class="flex justify-between border border-[#] bg-[#b6c7d9] rounded-lg font-semibold px-4 py-3">
                    <p>Total</p>
                    <p><%=total%> Dhs</p>
                </div>
            </div>
            <p class="text-sm text-center text-[#3E8456]">${success}</p>
        </div>
    </div>
</div>
</body>
</html>
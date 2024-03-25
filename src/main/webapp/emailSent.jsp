<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Email Verification</title>
    <%@ include file = "setup.jsp" %>
</head>
<body>
<%@ include file = "navbar.jsp" %>
<div class="container w-full h-screen font-poppin flex flex-col items-center justify-between">
    <div class="message-container pt-24">
        <div class="message bg-[#BCD2E3] w-96 text-[#000000] flex justify-evenly items-start py-4 px-3">
            <div class="icon-message pr-5">
                <svg class="text-2xl" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M438.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L160 338.7 393.4 105.4c12.5-12.5 32.8-12.5 45.3 0z"/></svg>
            </div>
            <div class="email-message">
                <h3 class="font-semibold">Password Reset Email Sent</h3>
                <p>
                    You should soon receive an email allowing you to reset your password. If you
                    do not find this email, please check your spam folder .
                </p>
            </div>
        </div>
    </div>
    <%@ include file = "footer.jsp" %>
</div>
</body>
</html>
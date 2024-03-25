<%@ page import="com.example.demo4.entities.Client" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@100;200;300;400;500;600;700;800;900&family=Montserrat:ital,wght@0,500;0,600;0,900;1,700;1,800;1,900&family=Poppins:wght@200;300;400;500;600;700;800&family=Roboto:ital,wght@0,300;0,400;0,700;0,900;1,700&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    width: {
                        'custom': '500px',
                    },
                    height : {
                        'custom' : '600px'
                    },
                    fontFamily: {
                        'poppin': ['"Poppins"', 'sans-serif'],
                    },
                }
            }
        }
    </script>

</head>
<%
    String token = (String) session.getAttribute("token");
%>
<body>
<%@ include file = "navbar.jsp" %>
<div class="container w-full h-screen flex justify-center items-center font-poppin " >
    <div  class="container-1 border-2 border-[#4262DA] flex  flex-col  justify-center  items-center space-y-8  w-custom h-custom  rounded-3xl   ">
        <div class="reset-title text-5xl font-bold  " >
            <h2>Choose Password</h2>
        </div>
        <div class="reset-paragh  text-center px-11  ">
            <p>Enter the new password </p>
        </div>
        <form action="reset-password-submit-servlet" method="post">
            <div class="inputs space-y-3">
                <div class="btn-passwd  ">
                    <input  class=" w-80 h-12 pl-4 bg-[#DBDBDB] rounded-xl " type="password"  placeholder="New password" id="password" name="password" >
                </div>
                <div class="btn-passwd mt-2 space-y-4 ">
                    <input  class=" w-80 h-12 pl-4 bg-[#DBDBDB] rounded-xl " type="password"  placeholder="Confirm password" id="confirmed-password" name="confirmed-password" >
                </div>
                <div>
                    <input type="hidden" value="<%=token%>" name="token" />
                </div>
            </div>
            <div class="Reset-btn mt-2 py-2 px-6 rounded-lg border-2  border-[#4262DA]">
                <input type="submit" id="submit" name="submit" value="Change" class="text-[#4262DA] text-xl cursor-pointer text-center" >
            </div>
            <p class="text-center text-sm mt-2 text-[#56834F]">${success}</p>
        </form>
    </div>
</div>

</body>
</html>
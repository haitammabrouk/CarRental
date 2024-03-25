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
    <title>Registration</title>
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
                        'custom' : '600px',
                        'semi-custon' : '650px'
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
<div class="container w-full h-screen flex justify-center items-center font-poppin">
    <div class="register-container border-2 border-[#4262DA] w-custom h-semi-custom flex justify-center rounded-3xl overflow-hidden ">
        <div class="main-section pt-2 flex flex-col items-center justify-center space-y-16 bg-[#ffffff]">
            <div class="register text-6xl pt-6 font-semibold">
                Sign up
            </div>
            <div class="register-form-container flex flex-col items-center justify-center">
                <div class="register-form ">
                    <form class="flex flex-col items-center" action="registration-servlet" method="post">
                        <div class="inputs space-y-3">
                            <div class="cin">
                                <input class="focus:border-blue-500 w-80 h-12 pl-4 bg-[#DBDBDB] rounded-xl" placeholder="CIN" type="text" id="cin" name="cin">
                            </div>
                            <div class="nom">
                                <input class="focus:border-blue-500 w-80 h-12 pl-4 bg-[#DBDBDB] rounded-xl" placeholder="Nom" type="text" id="nom" name="nom">
                            </div>
                            <div class="prenom">
                                <input class="focus:border-blue-500 w-80 h-12 pl-4 bg-[#DBDBDB] rounded-xl" placeholder="Prenom" type="text" id="prenom" name="prenom">
                            </div>
                            <div class="email">
                                <input class="focus:border-blue-500 w-80 h-12 pl-4 bg-[#DBDBDB] rounded-xl" placeholder="Email" type="email" id="email" name="email">
                            </div>
                            <div class="password">
                                <input class="w-80 h-12 pl-4 bg-[#DBDBDB] rounded-xl" placeholder="Create Password" type="password" id="password" name="password">
                            </div>
                            <div class="password-confirmed">
                                <input class="w-80 h-12 pl-4 bg-[#DBDBDB] rounded-xl" placeholder="Confirm Password" type="password" id="password-confirmation" name="password-confirmed">
                            </div>
                            <div class="text-[#A44646] text-center text-sm">
                                ${error}
                            </div>
                            <div class="text-[#558E61] text-center text-sm">
                                ${success}
                            </div>
                        </div>
                        <div class="submit mt-2 px-4 py-2 border-2 border-[#4262DA] rounded-lg">
                            <input class="text-[#4262DA] cursor-pointer" type="submit" value="Register">
                        </div>
                    </form>
                </div>
                <div class="register-forget text-normal pt-2 pb-3">
                    <span class="text-[#747373]">Already Have An Account?</span><a href="login.jsp" class="inline hover:underline text-[#4262DA]">Login</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
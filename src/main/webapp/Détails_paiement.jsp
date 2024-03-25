
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@100;200;300;400;500;600;700;800;900&family=Montserrat:ital,wght@0,500;0,600;0,900;1,700;1,800;1,900&family=Poppins:wght@200;300;400;500;600;700;800&family=Roboto:ital,wght@0,300;0,400;0,700;0,900;1,700&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {

                    fontFamily: {
                        'poppin': ['"Poppins"', 'sans-serif'],
                    },
                }
            }
        }
    </script>
</head>
<body>

<div class="container w-full h-screen flex  justify-center font-poppin">


    <%@ include file = "SideBar.jsp" %>


    <div class="ml-10 lg:w-5/6  space-y-4">
        <h1 class="text-gray-600 flex justify-center text-2xl mt-10 mb-10"> Registre de Paiement !</h1>
        <div class="bg-gray-50 p-6 rounded-md shadow-md">
            <h2 class="text-xl font-bold text-gray-800 mb-4">Informations du client :</h2>
            <div class="grid grid-cols-2 gap-4">
                <div>
                    <p class="text-sm text-gray-600">CNI Client :</p>
                    <p class="text-lg font-semibold text-gray-800"><%= request.getAttribute("cni") %></p>
                </div>
                <div>
                    <p class="text-sm text-gray-600">Numéro de carte :</p>
                    <p class="text-lg font-semibold text-gray-800"><%= request.getAttribute("num_carte") %></p>
                </div>
                <div>
                    <p class="text-sm text-gray-600">Date d'expiration :</p>
                    <p class="text-lg font-semibold text-gray-800"><%= request.getAttribute("expiry") %></p>
                </div>
                <div>
                    <p class="text-sm text-gray-600">Numéro de vérification :</p>
                    <p class="text-lg font-semibold text-gray-800"><%= request.getAttribute("num_ver") %></p>
                </div>
            </div>
        </div>



    </div>
</div>







</body>
</html>
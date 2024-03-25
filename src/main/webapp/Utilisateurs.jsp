<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo4.entities.Client" %>
<%@ page import="java.util.List" %>


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


    <div class="ml-20 lg:w-5/6  space-y-4">
        <h1 class="text-gray-600 flex justify-center text-2xl mt-10 mb-10"> Votre interface de gestion de clientèle !</h1>

        <div class="flex space-x-2 mt-40   ">

            <form action="rechercherUtilisateur" method="post">

                <label  class=" py-2 font-semibold"  for="nom">Rechercher Utilisateur:</label>
                <input  type="text" name="nom" id="nom" class="px-2 py-1 outline-none   border-2 hover:rounded-xl  rounded" placeholder="NOM">
                <button  class="px-2 py-1 rounded border-2  h-10 hover:rounded-xl hover:font-semibold text-white bg-[#4262DA]  " type="submit">Recherche</button>
            </form>
        </div>
        <table class="min-w-max w-full shadow-md mt-20">
            <thead>
            <tr class="bg-gray-100 text-black font-bold ">
                <th class="py-2 px-4 text-center ">CIN</th>
                <th class="py-2 px-4 text-center">Nom</th>
                <th class="py-2 px-4 text-center">Prénom</th>
                <th class="py-2 px-4 text-center ">E-mail</th>
                <th class="py-2 px-4 text-center ">Password</th>
                <th class="py-2 px-4 text-center ">Actions</th>
            </tr>
            </thead>
            <tbody class="text-gray-600 text-sm">
            <% for (Client client : (List<Client>) request.getAttribute("clients")) { %>

            <tr class="border-b border-gray-200 hover:bg-gray-100">
                <td class="py-2 px-4 text-center text-[#2557BC] font-semibold"><%= client.getCin() %></td>
                <td class="py-2 px-4 text-center  font-semibold"><%= client.getNom() %></td>
                <td class="py-2 px-4 text-center  font-semibold"><%= client.getPrenom()%> </td>
                <td class="py-2 px-4 text-center  font-semibold"><%= client.getEmail() %></td>
                <td class="py-2 px-4 text-center  font-semibold"><%= client.getPassword() %></td>
                <td class="py-2 px-4">
                    <div class="flex item-center justify-center space-x-4">
                        <a class="icon-red  hover:text-xl" href="SupprimerUtilisateur?cin=<%= client.getCin() %>">
                            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style> svg{fill:#f50000}</style><path d="M163.8 0H284.2c12.1 0 23.2 6.8 28.6 17.7L320 32h96c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 96 0 81.7 0 64S14.3 32 32 32h96l7.2-14.3C140.6 6.8 151.7 0 163.8 0zM32 128H416L394.8 467c-1.6 25.3-22.6 45-47.9 45H101.1c-25.3 0-46.3-19.7-47.9-45L32 128zm192 64c-6.4 0-12.5 2.5-17 7l-80 80c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0l39-39V408c0 13.3 10.7 24 24 24s24-10.7 24-24V273.9l39 39c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-80-80c-4.5-4.5-10.6-7-17-7z"/></svg>
                        </a>
                    </div>
                </td>
            </tr>

            <% } %>
            </tbody>
        </table>
    </div>
</div>







</body>

</html>
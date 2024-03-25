<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html lang="en">
<head>
    <title>Modifier une Voiture</title>
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

<%
    String matricule = request.getParameter("matricule");

    request.getSession().setAttribute("matriculeToModify", matricule);
%>
<div class="container w-full h-screen flex  justify-center font-poppin">
    <%@ include file = "SideBar.jsp" %>

    <div class="flex  items-center  flex-col lg:w-5/6 space-y-4">
        <h1 class="text-gray-600 flex justify-center text-2xl mt-10 mb-10">Modifier une Voiture !</h1>

        <div class="bg-gray-50 p-6 rounded-md shadow-md">
            <form action="ModifierVoiture" method="post" class="grid grid-cols-2 gap-4">

                <div class="space-x-2">
                    <label for="matriculenew" class="text-sm mr-4 text-gray-600">Matricule </label>
                    <input type="text" id="matriculenew" name="matriculenew" required class="border outline-none  rounded-md py-2 px-4" value="<%= request.getParameter("matricule") %>">
                </div>
                <div class="space-x-6">
                    <label for="type_moteurnew" class="text-sm text-gray-600"> Type de Moteur </label>
                    <input type="text" id="type_moteurnew" name="type_moteurnew" required class="border  outline-none rounded-md py-2 px-4" value="<%= request.getParameter("type_moteur") %>">
                </div>
                <div class="space-x-8">
                    <label for="marquenew" class="text-sm text-gray-600">Marque</label>
                    <input type="text" id="marquenew" name="marquenew" required class="border outline-none  rounded-md py-2 px-4" value="<%= request.getParameter("marque") %>">
                </div>
                <div class="space-x-2">
                    <label for="nb_placesnew" class="text-sm text-gray-600">Nombre de place </label>
                    <input type="text" id="nb_placesnew" name="nb_placesnew" required class="border  outline-none rounded-md py-2 px-4" value="<%= request.getParameter("nb_places") %>">
                </div>
                <div class="space-x-8">
                    <label for="modelenew" class="text-sm text-gray-600">Modèle </label>
                    <input type="text" id="modelenew" name="modelenew" required class="border outline-none rounded-md py-2 px-4" value="<%= request.getParameter("modele") %>">
                </div>
                <div class="space-x-12">
                    <label for="prix_reservationnew" class="text-sm text-gray-600">Prix par Jour </label>
                    <input type="number" id="prix_reservationnew" name="prix_reservationnew" required class="border outline-none rounded-md py-2 px-4" value="<%= request.getParameter("prix_reservation") %>">
                </div>
                <div class="col-span-2 flex justify-end">
                    <button type="submit" class="bg-[#4262DA] text-white font-bold py-2 px-4 rounded">Modifier</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>

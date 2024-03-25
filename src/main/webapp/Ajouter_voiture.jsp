<%@ page import="com.example.demo4.entities.Marque" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo4.dao.VoitureDao" %>
<%@ page import="com.example.demo4.entities.Voiture" %>
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
<%
    List<Object> moteurTypes = VoitureDao.getInstance().getFuelTypes();
%>
<body>

<div class="container w-full h-screen flex  justify-center font-poppin">
    <%@ include file = "SideBar.jsp" %>

    <div class="flex  items-center  flex-col lg:w-5/6 space-y-4">
        <h1 class="text-gray-600 flex justify-center text-2xl mt-10 mb-10">Ajouter une Voiture !</h1>


        <div class="bg-gray-50 p-6 rounded-md shadow-md">
            <form action="add-voiture-servlet" method="post" class="grid grid-cols-2 gap-4" enctype="multipart/form-data">
                <div class="space-x-2">
                    <label for="matricule" class="text-sm mr-4 text-gray-600">Matricule </label>
                    <input type="text" id="matricule" name="matricule" required class="border outline-none  rounded-md py-2 px-4">
                </div>
                <div>
                    <label for="fuel_type" class="text-sm text-gray-600">Type Moteur</label>
                    <select class="border outline-none w-72 ml-6 rounded-md py-2 px-4" name="fuel_type" id="fuel_type">
                        <% for(Object moteurType : moteurTypes){
                        %>
                        <option value="<%=(Voiture.MoteurEnum)moteurType%>"><%=(Voiture.MoteurEnum)moteurType%></option>
                        <% } %>
                    </select>
                </div>
                <div class="space-x-8">
                    <label for="marque" class="text-sm text-gray-600">Marque</label>
                    <input type="text" id="marque" name="marque" required class="border outline-none  rounded-md py-2 px-4">
                </div>
                <div class="space-x-2">
                    <label for="nb_places" class="text-sm text-gray-600">Nombre de place </label>
                    <input type="text" id="nb_places" name="nb_places" required class="border  outline-none rounded-md py-2 px-4">
                </div>
                <div class="space-x-8">
                    <label for="modele" class="text-sm text-gray-600">Modèle </label>
                    <input type="text" id="modele" name="modele" required class="border outline-none rounded-md py-2 px-4">
                </div>
                <div class="space-x-8">
                    <label class="text-sm text-gray-600" for="image">Image</label>
                    <input type="file" id="image" name="image" />
                </div>
                <div class="space-x-12">
                    <label for="prix_reservation" class="text-sm text-gray-600">Prix_J </label>
                    <input type="number" min="0" id="prix_reservation" name="prix_reservation" required class="border outline-none rounded-md py-2 px-4 mr-2">
                </div>

                <div class="col-span-2 flex justify-end">
                    <button type="submit" class="bg-[#4262DA] text-white font-bold py-2 px-4 rounded">Ajouter</button>
                </div>
            </form>

        </div>


    </div>
</div>



</body>
</html>

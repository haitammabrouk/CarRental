<%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 18/11/2023
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="voiture-servlet" method="post" enctype="multipart/form-data">

    <label for="image">Image</label>
    <input type="file" id="image" name="image" />

    <input type="submit" value="save" />
</form>
</body>
</html>

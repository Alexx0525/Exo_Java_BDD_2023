<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Exercice Chaine JSP</title>
</head>
<body>
<%
    String bonjour = "salut la compagnie";

    // Afficher en majuscules
    out.println("<p>Majuscules : " + bonjour.toUpperCase() + "</p>");

    // Afficher avec seulement la première lettre en majuscule
    String firstLetter = bonjour.substring(0, 1).toUpperCase();
    String rest = bonjour.substring(1);
    String capitalized = firstLetter + rest;

    out.println("<p>Première lettre en majuscule : " + capitalized + "</p>");
%>
</body>
</html>

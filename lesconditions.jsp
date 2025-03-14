<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur" name="valeur1">
    <p>Saisir la valeur 2 : <input type="text" id="inputValeur" name="valeur2">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String valeur1 = request.getParameter("valeur1"); %>
    <% String valeur2 = request.getParameter("valeur2"); %>

    <%-- Vérification de la condition entre les deux valeurs --%>
    <% if (valeur1 != null && valeur2 != null) { %>
        <%-- Conversion des valeurs en entiers pour la comparaison --%>
        <% int intValeur1 = Integer.parseInt(valeur1); %>
        <% int intValeur2 = Integer.parseInt(valeur2); %>
        
        <%-- Condition if pour comparer les valeurs --%>
        <% if (intValeur1 > intValeur2) { %>
            <p>Valeur 1 est supérieure à Valeur 2.</p>
        <% } else if (intValeur1 < intValeur2) { %>
            <p>Valeur 1 est inférieure à Valeur 2.</p>
        <% } else { %>
            <p>Valeur 1 est égale à Valeur 2.</p>
        <% } %>
   
    
<h2>Exercice 1 : Comparaison 1</h2>
<p>Demander à l'utilisateur de saisir 3 valeurs (A, B, C), et vérifier si la valeur de C est comprise entre A et B.</p>
<p>Exemple :</p>
<p>A = 10</p>
<p>B = 20</p>
<p>C = 15</p>
<p>Vérification : Est-ce que C est compris entre A et B ?</p>
<% 
    String valeurA = request.getParameter("valeurA");
    String valeurB = request.getParameter("valeurB");
    String valeurC = request.getParameter("valeurC");
    
    if (valeurA != null && valeurB != null && valeurC != null) {
        int A = Integer.parseInt(valeurA);
        int B = Integer.parseInt(valeurB);
        int C = Integer.parseInt(valeurC);
        
        if (C > A && C < B) {
%>
            <p>Oui, C est compris entre A et B.</p>
<% 
        } else {
%>
            <p>Non, C n'est pas compris entre A et B.</p>
<% 
        }
    }
%>

<h2>Exercice 2 : Pair ou Impair ?</h2>


<h2>Exercice 2 : Pair ou Impair ?</h2>
<p>Écrire un programme pour vérifier si un nombre est pair ou impair.</p>
<p>Exemple : Si l'utilisateur saisie la valeur 5, le programme doit afficher "Impair".</p>

<% 
    String valeurTest = request.getParameter("valeurTest");
    if (valeurTest != null) {
        int valeur = Integer.parseInt(valeurTest);
        
        if (valeur % 2 == 0) {
%>
            <p>Le nombre <%= valeur %> est pair.</p>
<% 
        } else {
%>
            <p>Le nombre <%= valeur %> est impair.</p>
<% 
        }
    }
%>

<form action="lesconditions.jsp" method="post">
    <p>Saisir une valeur pour tester pair ou impair : <input type="text" name="valeurTest"></p>
    <p><input type="submit" value="Vérifier"></p>
</form>

<% } %>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>

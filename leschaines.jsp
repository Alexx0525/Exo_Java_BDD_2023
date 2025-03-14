<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Exercices sur les chaînes de caractères</title>
</head>
<body bgcolor="white">
<h1>Exercices sur les chaînes de caractères</h1>

<form action="leschaines.jsp" method="post">
    <label for="inputChaine">Saisir une chaîne (min 6 caractères) : </label>
    <input type="text" id="inputChaine" name="chaine">
    <input type="submit" value="Afficher">
</form>

<%-- Récupération de la chaîne saisie par l'utilisateur --%>
<% 
    String chaine = request.getParameter("chaine"); 
    if (chaine != null && chaine.length() >= 6) {
%>

<h2>Exercice 1 : Combien de 'e' dans votre chaîne ?</h2>
<p>Ecrire un programme pour compter le nombre de lettre "e" dans votre chaîne de caractères.</p>
<% 
    int countE = 0;
    for (int i = 0; i < chaine.length(); i++) {
        if (chaine.charAt(i) == 'e') {
            countE++;
        }
    }
%>
<p>Le nombre de 'e' dans votre chaîne est : <%= countE %></p>

<h2>Exercice 2 : Affichage vertical</h2>
<p>Ecrire le programme pour afficher le texte en vertical.</p>
<p>Exemple : "Bonjour"</p>
<p>
<% 
    for (int i = 0; i < chaine.length(); i++) {
        out.println(chaine.charAt(i) + "<br>");
    }
%>
</p>

<h2>Exercice 3 : Retour à la ligne sur espace</h2>
<p>La présence d'un espace provoque un retour à la ligne.</p>
<p>Exemple : "L'hiver sera pluvieux"</p>
<p>
<% 
    String[] mots = chaine.split(" ");
    for (String mot : mots) {
        out.println(mot + "<br>");
    }
%>
</p>

<h2>Exercice 4 : Afficher une lettre sur deux</h2>
<p>Ecrire le programme pour afficher seulement une lettre sur deux de votre texte.</p>
<p>Exemple : "L'hiver sera pluvieux"</p>
<p>
<% 
    for (int i = 0; i < chaine.length(); i += 2) {
        out.print(chaine.charAt(i));
    }
%>
</p>

<h2>Exercice 5 : La phrase en verlan</h2>
<p>Ecrire le programme afin d'afficher le texte en verlan (inverse les caractères de chaque mot).</p>
<p>Exemple : "L'hiver sera pluvieux" devient "xueivulp ares revih'l".</p>
<p>
<% 
    String[] motsVerlan = chaine.split(" ");
    for (String mot : motsVerlan) {
        for (int i = mot.length() - 1; i >= 0; i--) {
            out.print(mot.charAt(i));
        }
        out.print(" ");
    }
%>
</p>

<h2>Exercice 6 : Compter les consonnes et voyelles</h2>
<p>Ecrire un programme pour compter le nombre de voyelles et de consonnes dans la chaîne.</p>
<p>
<% 
    int voyelles = 0, consonnes = 0;
    for (int i = 0; i < chaine.length(); i++) {
        char c = Character.toLowerCase(chaine.charAt(i));
        if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u') {
            voyelles++;
        } else if (Character.isLetter(c)) {
            consonnes++;
        }
    }
%>
<p>Voyelles : <%= voyelles %></p>
<p>Consonnes : <%= consonnes %></p>

<% } else { %>
    <p>Veuillez entrer une chaîne d'au moins 6 caractères.</p>
<% } %>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>

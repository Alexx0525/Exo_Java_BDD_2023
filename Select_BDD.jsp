<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MariaDB via JSP</title>
</head>
<body>
    <h1>Exemple de connexion à MariaDB avec JSP</h1>
    <% 
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "cnam";
    String password = "cnam";

        // Charger le pilote JDBC (pilote disponible dans WEB-INF/lib)
        Class.forName("org.mariadb.jdbc.Driver");

        // Établir la connexion
        Connection conn = DriverManager.getConnection(url, user, password);
        // Exemple de requête SQL
        String sql = "SELECT idFilm, titre, annee FROM Film WHERE annee >= 2000";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        // Afficher les résultats (à adapter selon vos besoins)
        while (rs.next()) {
            String colonne1 = rs.getString("idFilm");
            String colonne2 = rs.getString("titre");
            String colonne3 = rs.getString("annee");
            // Faites ce que vous voulez avec les données...
            //Exemple d'affichage de 2 colonnes
            out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "</br>");
        }

        // Fermer les ressources 
        rs.close();
        pstmt.close();
        conn.close();
    %>

<h2>Exercice 1 : Les films entre 2000 et 2015</h2>
<p>Extraire les films dont l'année est supérieur à l'année 2000 et inférieur à 2015.</p>

<% 
    // Requête pour extraire les films entre 2000 et 2015
    String sql1 = "SELECT idFilm, titre, annee FROM Film WHERE annee > 2000 AND annee < 2015";
    PreparedStatement pstmt1 = conn.prepareStatement(sql1);
    ResultSet rs1 = pstmt1.executeQuery();
    
    while (rs1.next()) {
        String idFilm = rs1.getString("idFilm");
        String titre = rs1.getString("titre");
        String annee = rs1.getString("annee");
        out.println("id : " + idFilm + ", titre : " + titre + ", année : " + annee + "<br>");
    }
    rs1.close();
    pstmt1.close();
    %>

<h2>Exercice 2 : Année de recherche</h2>
<p>Créer un champ de saisie permettant à l'utilisateur de choisir l'année de sa recherche.</p>

<form action="lesfilms.jsp" method="post">
        <label for="anneeRecherche">Saisir l'année : </label>
        <input type="number" id="anneeRecherche" name="anneeRecherche">
        <input type="submit" value="Rechercher">
    </form>
    <% 
    String anneeRecherche = request.getParameter("anneeRecherche");
    if (anneeRecherche != null && !anneeRecherche.isEmpty()) {
        String sql2 = "SELECT idFilm, titre, annee FROM Film WHERE annee = ?";
        PreparedStatement pstmt2 = conn.prepareStatement(sql2);
        pstmt2.setInt(1, Integer.parseInt(anneeRecherche));
        ResultSet rs2 = pstmt2.executeQuery();
        
        while (rs2.next()) {
            String idFilm = rs2.getString("idFilm");
            String titre = rs2.getString("titre");
            String annee = rs2.getString("annee");
            out.println("id : " + idFilm + ", titre : " + titre + ", année : " + annee + "<br>");
        }
        rs2.close();
        pstmt2.close();
    }
    %>

<h2>Exercice 3 : Modification du titre du film</h2>
<p>Créer un fichier permettant de modifier le titre d'un film sur la base de son ID (ID choisi par l'utilisateur)</p>

<form action="lesfilms.jsp" method="post">
        <label for="idFilm">ID du film : </label>
        <input type="text" id="idFilm" name="idFilm">
        <label for="nouveauTitre">Nouveau titre : </label>
        <input type="text" id="nouveauTitre" name="nouveauTitre">
        <input type="submit" value="Modifier">
    </form>
    <% 
    String idFilm = request.getParameter("idFilm");
    String nouveauTitre = request.getParameter("nouveauTitre");
    if (idFilm != null && !idFilm.isEmpty() && nouveauTitre != null && !nouveauTitre.isEmpty()) {
        String sql3 = "UPDATE Film SET titre = ? WHERE idFilm = ?";
        PreparedStatement pstmt3 = conn.prepareStatement(sql3);
        pstmt3.setString(1, nouveauTitre);
        pstmt3.setInt(2, Integer.parseInt(idFilm));
        int rowsAffected = pstmt3.executeUpdate();
        if (rowsAffected > 0) {
            out.println("Titre du film modifié avec succès !<br>");
        } else {
            out.println("Aucun film trouvé avec l'ID donné.<br>");
        }
        pstmt3.close();
    }
    %>

<h2>Exercice 4 : La valeur maximum</h2>
<p>Créer un formulaire pour saisir un nouveau film dans la base de données</p>

<form action="lesfilms.jsp" method="post">
        <label for="titreFilm">Titre du film : </label>
        <input type="text" id="titreFilm" name="titreFilm">
        <label for="anneeFilm">Année du film : </label>
        <input type="number" id="anneeFilm" name="anneeFilm">
        <input type="submit" value="Ajouter le film">
    </form>
    <% 
    String titreFilm = request.getParameter("titreFilm");
    String anneeFilm = request.getParameter("anneeFilm");
    if (titreFilm != null && !titreFilm.isEmpty() && anneeFilm != null && !anneeFilm.isEmpty()) {
        String sql4 = "INSERT INTO Film (titre, annee) VALUES (?, ?)";
        PreparedStatement pstmt4 = conn.prepareStatement(sql4);
        pstmt4.setString(1, titreFilm);
        pstmt4.setInt(2, Integer.parseInt(anneeFilm));
        int rowsInserted = pstmt4.executeUpdate();
        if (rowsInserted > 0) {
            out.println("Nouveau film ajouté avec succès !<br>");
        } else {
            out.println("Erreur lors de l'ajout du film.<br>");
        }
        pstmt4.close();
    }
    %>
<hr>
<h3>Projet Bibliothèque</h3>
<p>Votre projet consiste à concevoir et développer une application de gestion de bibliothèque moderne qui simplifie le processus de prêt et de retour de livres. Les fonctionnalités attendues dans le cadre de ce projet sont les suivantes :
<ul>
<li>L’enregistrement et la suppression de livres.</li>
<li>La recherche de livres disponibles.</li>
<li>L'emprunt possible d'un livre par un utilisateur.</li>
<li>La gestion des utilisateurs.</li>
<li>La gestion des stocks.</li>
</ul>
Votre travail est de créer votre code afin de répondre aux besoins définis ci-dessus. L'application exploitera le language JSP (JAVA) pour interagir avec la base de données MariaDB.
L’application pourra être enrichie avec des fonctionnalités supplémentaires telles que des recommandations de livres, des notifications pour les retours en retard, ou encore des rapports statistiques sur l'utilisation des livres pour améliorer l'expérience utilisateur et la gestion de la bibliothèque.
</p>
</body>
</html>

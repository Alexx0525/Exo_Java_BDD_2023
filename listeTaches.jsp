<%@ page import="java.util.*, model.Task" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des tâches</title>
</head>
<body>
    <h1>Mes tâches</h1>

    <%
        List<Task> listeTaches = (List<Task>) session.getAttribute("taches");
        if (listeTaches == null || listeTaches.isEmpty()) {
    %>
        <p>Aucune tâche enregistrée.</p>
    <%
        } else {
    %>
        <table border="1" cellpadding="10">
            <tr>
                <th>Titre</th>
                <th>Description</th>
                <th>Date d’échéance</th>
                <th>Statut</th>
            </tr>
        <%
            for (Task t : listeTaches) {
        %>
            <tr>
                <td><%= t.getTitre() %></td>
                <td><%= t.getDescription() %></td>
                <td><%= t.getDateEcheance() %></td>
                <td><%= t.isTerminee() ? "Terminée" : "En cours" %></td>
            </tr>
        <%
            }
        %>
        </table>
    <%
        }
    %>

    <br>
    <a href="lesboucles.jsp">Ajouter une autre tâche</a>
</body>
</html>
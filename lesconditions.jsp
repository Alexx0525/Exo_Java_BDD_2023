<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<html>
<head>
    <title>Gestion des Tâches</title>
</head>
<body bgcolor=white>
<h1>Saisir une tâche</h1>
<form action="#" method="post">
    <label for="inputValeur">Nom de la tâche : </label>
    <input type="text" id="inputValeur" name="valeur" required>

    <label for="dateFin">Date de fin : </label>
    <input type="date" id="dateFin" name="dateFin" required>

    <input type="submit" value="Enregistrer">
</form>

<%! 
    class MyClass {
        String nameTache;
        boolean terminee;
        String dateFin;

        public MyClass(String name, boolean terminee, String dateFin) {
            this.nameTache = name;
            this.terminee = terminee;
            this.dateFin = dateFin;
        }

        public void setStatus(boolean status) {
            this.terminee = status;
        }

        public String getStatus() {
            return terminee ? "Terminée" : "Non terminée";
        }
    }
%>

<%
    java.util.List<MyClass> taches = (java.util.List<MyClass>) session.getAttribute("taches");

    if (taches == null) {
        taches = new java.util.ArrayList<MyClass>();
    }

    String valeur = request.getParameter("valeur");
    String dateFin = request.getParameter("dateFin");

    if (valeur != null && !valeur.isEmpty() && dateFin != null && !dateFin.isEmpty()) {
        taches.add(new MyClass(valeur, false, dateFin));
    }

    String termineeParam = request.getParameter("terminee");
    String taskIndexParam = request.getParameter("taskIndex");

    if (taskIndexParam != null) {
        int taskIndex = Integer.parseInt(taskIndexParam);
        if (taskIndex >= 0 && taskIndex < taches.size()) {
            boolean terminee = termineeParam != null && termineeParam.equals("true");
            taches.get(taskIndex).setStatus(terminee);
        }
    }

    String deleteIndexParam = request.getParameter("deleteIndex");
    if (deleteIndexParam != null) {
        int deleteIndex = Integer.parseInt(deleteIndexParam);
        if (deleteIndex >= 0 && deleteIndex < taches.size()) {
            taches.remove(deleteIndex);
        }
    }

    session.setAttribute("taches", taches);
%>

<h2>Liste des Tâches</h2>
<table border="1">
    <tr>
        <th>Nom de la tâche</th>
        <th>Statut</th>
        <th>Date de fin</th>
        <th>Actions</th>
    </tr>
    <%
        for (int i = 0; i < taches.size(); i++) {
            MyClass task = taches.get(i);
    %>
    <tr>
        <td><%= task.nameTache %></td>
        <td><%= task.getStatus() %></td>
        <td><%= task.dateFin %></td>
        <td>
            <form action="#" method="post" style="display:inline;">
                <input type="hidden" name="taskIndex" value="<%= i %>">
                <input type="checkbox" name="terminee" value="true"
                    <%= task.terminee ? "checked" : "" %>
                    onchange="this.form.submit()">
            </form>
            <form action="#" method="post" style="display:inline;">
                <input type="hidden" name="deleteIndex" value="<%= i %>">
                <input type="submit" value="Supprimer">
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
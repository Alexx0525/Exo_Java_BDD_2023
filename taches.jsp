<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Gestionnaire de Tâches</title>
</head>
<body>
    <h2>Ajouter une tâche</h2>

    <form method="post" action="taches.jsp">
        Tâche : <input type="text" name="tache" required />
        Terminée ? <input type="checkbox" name="terminee" />
        <input type="submit" value="Ajouter" />
    </form>

    <%
        // Récupération ou création de la liste de tâches (clé = nom, valeur = terminé ?)
        Map<String, Boolean> taches = (Map<String, Boolean>) session.getAttribute("taches");
        if (taches == null) {
            taches = new LinkedHashMap<>();
            session.setAttribute("taches", taches);
        }

        // Traitement du formulaire
        String nouvelleTache = request.getParameter("tache");
        boolean estTerminee = request.getParameter("terminee") != null;

        if (nouvelleTache != null && !nouvelleTache.trim().isEmpty()) {
            taches.put(nouvelleTache, estTerminee);
        }
    %>

    <h2>Liste des tâches</h2>
    <ul>
        <%
            for (Map.Entry<String, Boolean> entry : taches.entrySet()) {
                String titre = entry.getKey();
                Boolean terminee = entry.getValue();
            }
        %>
    </ul>
</body>
</html>
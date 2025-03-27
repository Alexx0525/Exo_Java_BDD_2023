<html>
    <body>
    <h1>Liste des tâches</h1>
    <%
        ArrayList<Task> listeTaches = (ArrayList<Task>) session.getAttribute("listeTaches");
        if (listeTaches != null && !listeTaches.isEmpty()) {
    %>
        <table border="1">
            <tr>
                <th>Titre</th>
                <th>Description</th>
                <th>Date d'échéance</th>
                <th>Terminée</th>
                <th>Action</th>
            </tr>
            <%
                for (int i = 0; i < listeTaches.size(); i++) {
                    Task tache = listeTaches.get(i);
            %>
            <tr>
                <td><%= tache.getTitre() %></td>
                <td><%= tache.getDescription() %></td>
                <td><%= tache.getDateEcheance() %></td>
                <td><%= tache.isTerminee() ? "Oui" : "Non" %></td>
                <td>
                    <a href="afficherTaches.jsp?delete=<%=i%>">Supprimer</a> |
                    <a href="afficherTaches.jsp?complete=<%=i%>">Marquer comme terminée</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    <%
        } else {
            out.println("<p>Aucune tâche enregistrée.</p>");
        }
    
        // Gestion suppression et tâche terminée
        String delete = request.getParameter("delete");
        String complete = request.getParameter("complete");
    
        if (delete != null) {
            int index = Integer.parseInt(delete);
            listeTaches.remove(index);
            response.sendRedirect("afficherTaches.jsp");
        }
    
        if (complete != null) {
            int index = Integer.parseInt(complete);
            listeTaches.get(index).setTerminee(true);
            response.sendRedirect("afficherTaches.jsp");
        }
    %>
    
    <a href="ajoutTache.jsp">Ajouter une nouvelle tâche</a>
    </body>
    </html>
    
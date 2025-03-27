<%@ page import="com.example.Task" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>listesTaches</title>
</head>
<body>
    <h2>listesTaches</h2>

    <%
        Task task = new Task("Finish project", "Complete the Java project by tomorrow", new java.util.Date());
    %>

    <p><strong>Title:</strong> <%= task.getTitle() %></p>
    <p><strong>Description:</strong> <%= task.getDescription() %></p>
    <p><strong>Due Date:</strong> <%= task.getDueDate() %></p>
    <p><strong>Completed:</strong> <%= task.isCompleted() ? "Oui" : "NON" %></p>

</body>
</html>
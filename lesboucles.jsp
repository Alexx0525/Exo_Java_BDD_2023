<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.util.*" %>

<html>
<head>
    <title>Exercices sur les boucles</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les boucles</h1>
    
    <form action="#" method="post">
        <label for="inputValeur">Saisir le nombre d'étoiles : </label>
        <input type="text" id="inputValeur" name="valeur">
        <input type="submit" value="Afficher">
    </form>

    <%-- Récupération de la valeur saisie par l'utilisateur --%>
    <% String valeur = request.getParameter("valeur"); %>

    <%-- Vérification de l'existence de la valeur --%>
    <% if (valeur != null && !valeur.isEmpty()) { 
        int n = Integer.parseInt(valeur);
    %>
    
    <h2>Affichage d'une ligne d'étoiles</h2>
    <p>
    <% for (int i = 1; i <= n; i++) { %>
        *
    <% } %>
    </p>

    <h2>Exercice 1 : Le carré d'étoiles</h2>
    <pre>
    <% for (int i = 0; i < n; i++) { 
        for (int j = 0; j < n; j++) { 
            out.print("*");
        }
        out.println();
    } %>
    </pre>

    <h2>Exercice 2 : Triangle rectangle gauche</h2>
    <pre>
    <% for (int i = 1; i <= n; i++) { 
        for (int j = 0; j < i; j++) { 
            out.print("*");
        }
        out.println();
    } %>
    </pre>

    <h2>Exercice 3 : Triangle rectangle inversé</h2>
    <pre>
    <% for (int i = n; i > 0; i--) { 
        for (int j = 0; j < i; j++) { 
            out.print("*");
        }
        out.println();
    } %>
    </pre>

    <h2>Exercice 4 : Triangle rectangle aligné à droite</h2>
    <pre>
    <% for (int i = 1; i <= n; i++) { 
        for (int j = 0; j < n - i; j++) { 
            out.print(" ");
        }
        for (int k = 0; k < i; k++) { 
            out.print("*");
        }
        out.println();
    } %>
    </pre>

    <h2>Exercice 5 : Triangle isocèle</h2>
    <pre>
    <% for (int i = 1; i <= n; i++) { 
        for (int j = 0; j < n - i; j++) { 
            out.print(" ");
        }
        for (int k = 0; k < (2 * i - 1); k++) { 
            out.print("*");
        }
        out.println();
    } %>
    </pre>

    <h2>Exercice 6 : Demi-losange</h2>
    <pre>
    <% 
    // Partie haute
    for (int i = 1; i <= n; i++) { 
        for (int j = 0; j < n - i; j++) { 
            out.print(" ");
        }
        for (int k = 0; k < i; k++) { 
            out.print("*");
        }
        out.println();
    } 
    // Partie basse
    for (int i = n - 1; i > 0; i--) { 
        for (int j = 0; j < n - i; j++) { 
            out.print(" ");
        }
        for (int k = 0; k < i; k++) { 
            out.print("*");
        }
        out.println();
    } 
    %>
    </pre>

<h2>Exercice 7 : La table de multiplication</h2>
  <pre>
    <% for (int i = 1; i <= 10; i++) { %>
        <%= n %> x <%= i %> = <%= n * i %>
    <% } %>
    </pre>

    <% } %>
</body>
</html>

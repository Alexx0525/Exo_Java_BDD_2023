<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String bonjour = "salut la compagnie";

    // Fonction pour mettre la première lettre en majuscule
    String capitalizeFirstLetter(String input) {
        if (input == null || input.isEmpty()) {
            return input;
        }
        return input.substring(0, 1).toUpperCase() + input.substring(1);
    }

    out.println("Majuscules : " + bonjour.toUpperCase() + "<br>");
    out.println("Première lettre en majuscule : " + capitalizeFirstLetter(bonjour));
%>


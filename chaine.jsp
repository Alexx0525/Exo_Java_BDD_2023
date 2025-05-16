public class chaine {
    public static void main(String[] args) {
        String bonjour = "salut la compagnie";

        // Affichage en majuscules
        System.out.println("Majuscules : " + bonjour.toUpperCase());

        // Affichage avec seulement la première lettre en majuscule
        System.out.println("Première lettre en majuscule : " + capitalizeFirstLetter(bonjour));
    }

        return input.substring(0, 1).toUpperCase() + input.substring(1);
    }
}

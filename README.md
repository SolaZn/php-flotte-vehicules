# php-flotte-vehicules

Projet de PHP sur la location de véhicules

--> quelle structure :
---> données
éléments

client [id, nom, pseudo, mdp, email,nomE, adresseE],
vehicule [id, type, nb, caract, photo, etatL]
facture [id, ide, idv, dateD, dateF, valeur, etatR]

---> services
index.php -> sera le fichier frontal du site
-> 3 espaces
-> NON CLIENT
**moyen d'accès** -> affiché d'emblée dès le lancement du site (service par défaut)
**fonctions**
-> affichage carrousel véhicules (sélection BDD)
-> Inscription (insertion BDD)
-> si Inscription validée -> renvoi vers service ABONNE
-> ABONNE
**moyen d'accès** -> accessible par un bouton "Connexion" -> "Gestion abonnement"
**fonctions**
-> Connexion (selection/verification BDD)
-> Déconnexion
-> affichage liste véhicules que Ent a loué (selection BDD)
-> afficher liste dispo et possibilité sélectionner véhicule(s) à louer parmi disponibles à la location (selection BDD)
-> enregistrement location véhicule (avec date debut/fin\*) (insertion/modification BDD (dans tables Véhicules et FlotteEntreprise))
-> il faudra créer une facturation qui correspondra au véhicule
-> ADMIN
**moyen d'accès** -> accessible par un bouton "Connexion" -> "Administration"
**fonctions**
-> Connexion (selection/verification BDD)
-> affichage stock véhicules (selection BDD)
-> affichage locations en cours (sélection BDD)
-> ajout/retrait de véhicules (insertion/modification BDD (impossible de sup. voiture louée))
-> calcul des factures pour le mois courant (sélection et affichage BDD + insertion des résultats dans les factures)
-> affichage facture de flotte par entreprise avec détail par véhicule (sélection BDD)
-> Considérer promo si longue location
-> Si date fin location après fin du mois, mensualiser les jours du mois courant.
-> Mettre en place réduction de 10% si flotte véhicule sup à 10

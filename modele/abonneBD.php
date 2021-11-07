<?php

// fonctions de connexion
function getCredentials($login, &$profil=array()){
    require("./modele/connectBD.php");

    $sql="SELECT id, nom, pseudo, denomEnt, adresseEnt FROM `client` WHERE pseudo=:pseudo";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':pseudo', $login);
			$bool = $commande->execute();
			if ($bool) 
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
		
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage());
			die(); 
		}

		if (count($resultat) == 0) {
			$profil = null; 
			return false; 
		}
		else {
			$profil = $resultat[0]; 
        }
}

function getHash($login, &$hash=array()){
    require("./modele/connectBD.php");

    $sql="SELECT mdp FROM `client` WHERE pseudo=:pseudo";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':pseudo', $login);
			$bool = $commande->execute();
			if ($bool) 
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
		
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage());
			die(); 
		}

		if (count($resultat) == 0) {
			$hash = ""; 
			return false; 
		}
		else {
			$hash = $resultat[0]; 
            return true;
        }
}

// fonctions d'affichage
function getVehicules($idClient, &$vehicules = array()){
	require("./modele/connectBD.php");

    $sql="SELECT * FROM `vehicule` WHERE etat=:id";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':id', $idClient);
			$bool = $commande->execute();
			if ($bool) 
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
		
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage());
			die(); 
		}

		if (count($resultat) == 0) {
			$vehicules = ""; 
			return false; 
		}
		else {
			$vehicules = $resultat; 
            return true;
        }
}

function getAvailableVehicles(&$vehicules = array()){
	require("./modele/connectBD.php");

	$dispo = "disponible";
	
	$sql="SELECT * FROM `vehicule` WHERE etat=:dispo";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':dispo', $dispo);
			$bool = $commande->execute();
			if ($bool) 
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
		
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage());
			die(); 
		}

		if (count($resultat) == 0) {
			$vehicules = ""; 
			return false; 
		}
		else {
			$vehicules = $resultat; 
            return true;
        }
}

?>
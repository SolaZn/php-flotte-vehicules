<?php

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

?>
<?php

// fonctions de connexion
function getCredentials($login, &$profil = array())
{
	require("./modele/connectBD.php");

	$sql = "SELECT id, nom, pseudo, denomEnt, adresseEnt FROM `client` WHERE pseudo=:pseudo";
	try {
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':pseudo', $login);
		$bool = $commande->execute();
		if ($bool)
			$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
	} catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage());
		die();
	}

	if (count($resultat) == 0) {
		$profil = null;
		return false;
	} else {
		$profil = $resultat[0];
	}
}

function getHash($login, &$hash = array())
{
	require("./modele/connectBD.php");

	$sql = "SELECT mdp FROM `client` WHERE pseudo=:pseudo";
	try {
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':pseudo', $login);
		$bool = $commande->execute();
		if ($bool)
			$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
	} catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage());
		die();
	}

	if (count($resultat) == 0) {
		$hash = "";
		return false;
	} else {
		$hash = $resultat[0];
		return true;
	}
}

// fonctions d'affichage
function getVehicules($idClient, &$vehicules = array())
{
	require("./modele/connectBD.php");

	$sql = "SELECT vehicule.*, facture.dateDebut, facture.dateFin, facture.montant FROM `vehicule` JOIN facture ON facture.idVehicule = vehicule.id WHERE etat=:id";
	try {
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':id', $idClient);
		$bool = $commande->execute();
		if ($bool)
			$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
	} catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage());
		die();
	}

	if (count($resultat) == 0) {
		$vehicules = "";
		return false;
	} else {
		$vehicules = $resultat;
		return true;
	}
}

function getAvailableVehicles(&$vehicules = array()){
	require("./modele/connectBD.php");

	$dispo = "disponible";

	$sql = "SELECT * FROM `vehicule` WHERE etat=:dispo";
	try {
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':dispo', $dispo);
		$bool = $commande->execute();
		if ($bool)
			$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
	} catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage());
		die();
	}

	if (count($resultat) == 0) {
		$vehicules = "";
		return false;
	} else {
		$vehicules = $resultat;
		return true;
	}
}

function getVehicleInfo($idVehicule, &$vehicule = array())
{
	require("./modele/connectBD.php");

	$sql = "SELECT * FROM `vehicule` WHERE id=:id";
	try {
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':id', $idVehicule);
		$bool = $commande->execute();
		if ($bool)
			$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
	} catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage());
		die();
	}

	if (count($resultat) == 0) {
		$vehicule = "";
		return false;
	} else {
		$vehicule = $resultat[0];
		return true;
	}
}

// fonctions de changement de statut

function changeVehicleState($idVehicule, $etat)
{
	require("./modele/connectBD.php");

	$sql = "UPDATE `vehicule` SET etat=:etat WHERE id=:id";
	try {
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':etat', $etat);
		$commande->bindParam(':id', $idVehicule);
		$commande->execute();
		return true;
	} catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage());
		die();
	}
}

function setNewInvoice($idVehicule, $idClient, $dateDebut, $dateFin)
{
	require("./modele/connectBD.php");

	$vehicule = array();

	if (getVehicleInfo($idVehicule, $vehicule)) {
		$debut = new DateTime($dateDebut);
		$fin = new DateTime($dateFin);

		var_dump($vehicule);

		$intervalle = date_diff($debut, $fin, true);
		
		$specs = json_decode($vehicule['specs'], true);

		$montant = $intervalle->d * $specs['prix'];

		$etatFacture = 0;

		if(empty($dateFin)){
			$sql = "INSERT INTO `facture`(`idClient`, `idVehicule`, `dateDebut`, `etatReglement`) 
				VALUES (:idClient,:idVehicule,:dateDebut,:etat)";
		}else{
			$sql = "INSERT INTO `facture`(`idClient`, `idVehicule`, `dateDebut`, `dateFin`, `montant`, `etatReglement`) 
				VALUES (:idClient,:idVehicule,:dateDebut,:dateFin,:montant,:etat)";
		}

		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':idClient', $idClient);
			$commande->bindParam(':idVehicule', $idVehicule);
			$commande->bindParam(':dateDebut', $dateDebut);
			if(!empty($dateFin)){
				$commande->bindParam(':dateFin', $dateFin);
				$commande->bindParam(':montant', $montant);
			}
			$commande->bindParam(':etat', $etatFacture);
			$commande->execute();
			return true;
		} catch (PDOException $e) {
			echo utf8_encode("Echec de insert : " . $e->getMessage());
			die();
		}
	}
}

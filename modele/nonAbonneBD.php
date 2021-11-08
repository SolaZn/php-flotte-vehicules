<?php

function voitDisp(&$listeVoit = array())
{
	require("./modele/connectBD.php");
	$sql = "SELECT * FROM vehicule WHERE etat='disponible' GROUP BY type";


	try {
		$commande = $pdo->prepare($sql);
		$commande->execute();
		if ($commande->rowCount() > 0) {
			$listeVoit = $commande->fetchAll();
			return true;
		} else {
			return false;
		}
	} catch (PDOException $e) {
		$msg = utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die($msg);
	}
}

function verifEmailIns($email, &$profil)
{
	require("./modele/connectBD.php");
	$sql = "SELECT * FROM `client`  where email=:email";

	try {
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':email', $email, PDO::PARAM_STR);
		$commande->execute();

		if ($commande->rowCount() > 0) {
			$profil = $commande->fetch(PDO::FETCH_ASSOC);
			return true;
		} else {
			return false;
		}
	} catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}

function verifPseudoIns($pseudo, &$profil)
{
	require("./modele/connectBD.php");
	$sql = "SELECT * FROM `client`  where pseudo=:pseudo";

	try {
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':pseudo', $pseudo, PDO::PARAM_STR);
		$commande->execute();

		if ($commande->rowCount() > 0) {
			$profil = $commande->fetch(PDO::FETCH_ASSOC);
			return true;
		} else {
			return false;
		}
	} catch (PDOException $e) {
		echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
		die();
	}
}

function ajouter_persone($nom, $mdp, $pseudo, $email, $adresseEnt, $denomEnt)
{
	require("./modele/connectBD.php");
	$sql = "INSERT INTO client (nom, pseudo, mdp, email, denomEnt, adresseEnt) VALUES (:nom, :pseudo, :mdp, :email, :denomEnt, :adresseEnt)";

	try {
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':nom', $nom, PDO::PARAM_STR);
		$commande->bindParam(':pseudo', $pseudo, PDO::PARAM_STR);
		$commande->bindParam(':mdp', $mdp, PDO::PARAM_STR);
		$commande->bindParam(':email', $email, PDO::PARAM_STR);
		$commande->bindParam(':denomEnt', $denomEnt, PDO::PARAM_STR);
		$commande->bindParam(':adresseEnt', $adresseEnt, PDO::PARAM_STR);
		$commande->execute();
		return true;
	} catch (PDOException $e) {
		echo utf8_encode("Echec d'insert : " . $e->getMessage() . "\n");
		die();
	}
}

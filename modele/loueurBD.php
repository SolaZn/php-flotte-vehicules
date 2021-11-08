<?php
$vehicules = array();
$voitures = array();
$vlocations = array();

function afficherVehiculesDPR(&$vehicules){
	require("./modele/connectBD.php");
	$sql = "SELECT *FROM vehicule WHERE etat='disponible' OR etat ='en_révision' ORDER BY id ASC";
	$commande = $pdo->prepare($sql);
	$commande->execute();
  $vehicules = $commande->fetchAll();
}


function afficherStock(&$voitures){
    require("./modele/connectBD.php");
	$sql = "SELECT * FROM `vehicule` ORDER BY `vehicule`.`etat` DESC";
	$commande = $pdo->prepare($sql);
	$commande->execute();
   $voitures = $commande->fetchAll();
    
}


function afficherLocation(&$vlocations){
	require("./modele/connectBD.php");
	$sql ="SELECT vehicule.*, client.*, facture.* FROM facture JOIN vehicule ON facture.idVehicule = vehicule.id JOIN client ON facture.idClient = client.id WHERE vehicule.etat = vehicule.id ORDER BY client.nom";
	$commande = $pdo->prepare($sql);
	$commande->execute();
	$vlocations = $commande->fetchAll();
}

$email = isset($_POST['email']) ? $_POST['email'] : '';
$mdp = isset($_POST['mdp']) ? $_POST['mdp'] : '';
$typev = isset($_POST['typev']) ? $_POST['typev'] : '';
$energie = isset($_POST['energie']) ? $_POST['energie']: '';
$boite = isset($_POST['boite']) ? $_POST['boite']: '';
$location = isset($_POST['location']) ? $_POST['location']: '';
$nbplaces = isset($_POST['places']) ? $_POST['places']: '';
$photo = isset($_POST['photo']) ? $_POST['photo']: '';
$type = isset($_POST['retraitnom']) ? $_POST['retraitnom']:'';



function retraitVoiture($id){
	require("./modele/connectBD.php");
	$sql = "DELETE FROM vehicule where vehicule.id =:id";

	try {
        $commande = $pdo->prepare($sql);
		$commande->bindParam(':id',$id);
        $commande->execute();
        return true;
    } catch (PDOException $e) {
        echo utf8_encode("Echec de la suppression : " . $e->GetMessage() . "\n");
        die();
    }

}

function changeEtat($location, $id)
{
    require('modele/connectBD.php');
    $sql = "UPDATE `vehicule` SET etat = :location WHERE id = :id";
    try {
    $commande = $pdo->prepare($sql);
    $commande->bindParam(':location',$location);
    $commande->bindParam(':id',$id);
    $commande->execute();
    return true;
    } catch (PDOException $e) {
        echo utf8_encode("Echec de la modif : " . $e->GetMessage() . "\n");
        die();
     }   

}

function ajouterVoiture($type, $prix, $energie, $boite, $nbplaces, $location, $photo){
	require("./modele/connectBD.php");

	$places = $nbplaces . ' places';
	$specs = array("prix"=>$prix, "moteur"=>$energie, "boite"=>$boite, "places"=>$places);

	$specs = json_encode($specs);

    $sql = "INSERT INTO vehicule(type, specs, image, etat) VALUES (:type , :specs ,:image, :etat)";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':type', $type, PDO::PARAM_STR);
        $commande->bindParam(':specs', $specs);
        $commande->bindParam(':etat',$location, PDO::PARAM_STR);
        $commande->bindParam(':image', $photo, PDO::PARAM_STR);
        $commande->execute();
        return true;
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->GetMessage() . "\n");
        die();
    }
    mysqli_close($commande);
}

// Fonction verifVoiture : utilisé pour vérifier qu'un véhicule est bein présent dans la base de données
function verifVoiture($typev, $energie, $boite, $location, &$vehicules){
    require("./modele/connectBD.php");
    $sql= "SELECT *FROM vehicule where type_v = :typev, energie_v = :energie, boite_v = :boite, location_v = :location_v";
    try {
        $commande = $pdo->prepare($sql);
        $commande->bindParam(':typev', $typev, PDO::PARAM_STR);
        $commande->bindParam(':energie', $energie, PDO::PARAM_STR);
		$commande->bindParam(':boite', $boite, PDO::PARAM_STR);
		$commande->bindParam(':location_v',$location, PDO::PARAM_STR);
        $commande->execute();
        if (($commande->rowCount()) > 0) {
            $vehicules = $commande->fetchAll();
            return true;
        } else {
            return false;
        }
    } catch (PDOException $e) {
        echo utf8_encode("Echec de select : " . $e->GetMessage() . "\n");
        die();
    }
}

function verificationLoueur($email, $mdp, &$profil){
	require("./modele/connectBD.php");
	$sql = "SELECT *FROM  `loueur` where email_l = :email and mdp_l = :mdp";
	try {
		$commande = $pdo->prepare($sql);
		$commande->bindParam(':email', $email, PDO::PARAM_STR);
		$commande->bindParam(':mdp', $mdp, PDO::PARAM_STR);
		$commande->execute();
		if (($commande->rowCount()) > 0) {
			$profil = $commande->fetchAll();//save profil
			return true;
		} else {
			return false;
		}

	} catch (PDOException $e) {
		echo utf8_encode("error: " . $e->GetMessage() . "\n");
		die();
	}
}

?>
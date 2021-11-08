<?php

function connexionLoueur()
{
    $nom = isset($_POST['nom']) ? $_POST['nom'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $mdp = isset($_POST['mdp']) ? $_POST['mdp'] : '';
    $profil = array();

    if (count($_POST) == 0) require("./vue/loueur/connexionLoueur.tpl");

    else {
        require('./modele/loueurBD.php');
        $msg = '';
        if (isset($_POST['email'], $_POST['mdp'])) {
            // Vérification que email et mdp soit non null
            if (empty($_POST['email']) && empty($_POST['mdp'])) {
                $msg = "Champs vide";
            } elseif (empty($_POST['email'])) {
                die("Adresse mail manquante.");
            } elseif (empty($_POST['mdp'])) {
                die("Mot de passe manquant.");
            } else {
                if (verificationLoueur($email, $profil)) {
                    $hash = "";
                    getHash($email, $hash);
                    if(password_verify($mdp, $hash['mdp'])){
                        $_SESSION['profil'] = $profil;
                        // On renvoie à l'espace en tant que connecté "loueur"
                        $url = "index.php?controle=loueur&action=connecteL";
                        header("Location:" . $url);
                    }else{
                        require("./vue/loueur/connexionLoueur.tpl");
                    }
                }else{
                    require("./vue/loueur/connexionLoueur.tpl");
                }
            }
        }
    }
}

function connecteL()
{
    require_once("./modele/loueurBD.php");

    afficherStock($voitures);
    afficherLocation($vlocations);
    afficherVehiculesDPR($vehicules);
    afficherClients($clients);

    require("./vue/loueur/loueur.tpl");
}


function deconnexion()
{
    session_unset();
    session_destroy();

    $url = "index.php?controle=nonAbonne&action=accueil";
    header("Location:" . $url);
}


function changerEtatVehicule()
{
    if (count($_POST) == 0) require("./vue/loueur/loueur.tpl");
    else {
        require("./modele/loueurBD.php");
        $msg = '';
        // On vérifie l'existence des champs puis on vérifie certaines conditions
        if (isset($_POST['location'], $_POST['id'])) {
            if (empty($_POST['location'])) {
                echo "etat du véhicules manquant";
                require("./vue/loueur/loueur.tpl");
            } elseif (empty($_POST['id'])) {
                echo "Véhicule manquant";
                require("./vue/loueur/loueur.tpl");
            } else { //si tout est present
                if (!empty($_POST['id']) && !empty($_POST['location'])) {
                    changeEtat($_POST['location'], $_POST['id']);
                    // Redirection vers l'espace
                    $url = "index.php?controle=loueur&action=connecteL";
                    header("Location:" . $url);
                }
            }
        }
    }
}

function ajout()
{
    if (count($_POST) == 0) require("./vue/loueur/loueur.tpl");
    else {
        require("./modele/loueurBD.php");
        $msg = '';
        // On vérifie l'existence des champs puis on vérifie certaines conditions
        var_dump($_POST);
        if (isset($_POST['places'], $_POST['type'], $_POST['energie'], $_POST['boite'], $_POST['location'], $_POST['prix'])) {
            if (empty($_POST['type'])) {
                echo "nom du véhicule manquant";
            } elseif (empty($_POST['energie'])) {
                echo "type d'énergie du véhicule manquant";
            } elseif (empty($_POST['boite'])) {
                echo "type de boîte de vitesse manquant";
            } elseif (strlen($_POST['type']) > 30) {
                echo "Le nom du véhicule trop long";
            } elseif (empty($_POST['photo'])) {
                echo "photo introuvable";
            } elseif (empty($_POST['prix'])) {
                echo 'prix non renseigné';
            } else { //si tout est present
                if (!empty($_POST['type']) && !empty($_POST['energie']) && !empty($_POST['boite']) && !empty($_POST['location']) && !empty($_POST['places']) && !empty($_POST['photo'])) {
                    echo "<pre>", print_r($_FILES['photo']), "</pre>";
                    $photo_test = "./vue/content/images/vehicules/" . $_POST['photo'];
                    var_dump($_POST);
                    //add voitures
                    ajouterVoiture($_POST['type'], $_POST['prix'], $_POST['energie'], $_POST['boite'], $_POST['places'], $_POST['location'], $photo_test);
                    // Redirection vers l'espace
                    $url = "index.php?controle=loueur&action=connecteL";
                    header("Location:" . $url);
                }
            }
        } else {
            echo 'Information manquante';
            require("./vue/loueur/loueur.tpl");
        }
    }
}

// Action -> retrait 
//qui va permettre de retirer un véhicule du stock de véhicule
function retrait()
{
    if (count($_POST) == 0) require("./vue/loueur/loueur.tpl");
    else {
        require("./modele/loueurBD.php");

        // On vérifie que le champ contenant le nom du véhicule ne soit pas vide
        if (!empty($_POST['id'])) {
            retraitVoiture($_POST['id']);

            $url = "index.php?controle=loueur&action=connecteL";
            header("Location:" . $url);
        }
    }
}

function facturationLoueur(){
    if (count($_POST) == 0)     require('./vue/loueur/loueur.tpl');
    else {
        require("./modele/loueurBD.php");

        // On vérifie que le champ contenant le nom du véhicule ne soit pas vide
        if (!empty($_POST['idClient'])) {
            $vehicules = array();
            getVehicules($_POST['idClient'], $vehicules);
            if(!empty($vehicules)){
                $factures = array();
                foreach($vehicules as $vehicule){
                    getFacture($vehicule['id'], $factures[]);
                }
                require('./vue/loueur/facturationLoueur.tpl');
            }
            else{
                echo 'a';
            }
        }else{
            echo 'b';
        }
    }
}

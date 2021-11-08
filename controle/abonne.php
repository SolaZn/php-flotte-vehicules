<?php
//TODO: Cookies + afficher les dates de début et de fin pour chaque véhicule loué + commenter les fonctions

function connexionAbonne($mode = "")
{
    // on récupère les éventuelles informations déjà reçues par POST
    $login = isset($_POST['login']) ? ($_POST['login']) : '';
    $password = isset($_POST['password']) ? ($_POST['password']) : '';

    // on prépare un tableau vide pour stocker les informations de session
    // de l'utilisateur qui se connectera plus tard.
    $profil = array();

    if ($mode == "NEW_USER") {
        // remplir les informations de session et procéder à la connexion

        set_session($profil);
        set_cookie($profil);
    } else {
        if (count($_POST) == 0) {
            require("./vue/abonne/connexionAbonne.tpl");
        } else {
            if (verification_login($login, $password)) {
                // Ou alors créer un tableau qui comporte les 
                // deux informations à transmettre

                set_cookie($profil);

                $url = "index.php?controle=abonne&action=accueilAbonne";
                header("Location:" . $url);
                //on peut éventuellement utiliser cURL ou JSON pour
                // transmettre avec POST nos informations

                // Plus besoin de créer une URL paramétrique puisque
                // désormais les variables ne sont plus transmises 
                // par méthode POST ou GET mais à travers le fichier
                // contenant les variables de session
            } else {
                require("./vue/abonne/connexionAbonne.tpl");
            }
        }
    }
}


function verification_login($login, $password)
{
    require("./modele/abonneBD.php"); // comme un include

    $hash = array();
    if (getHash($login, $hash)) {
        if (password_verify($password, $hash['mdp'])) {
            // si le mot de passe est bon
            $profil = array();
            getCredentials($login, $profil);
            set_session($profil);
            return true;
        } else {
            // si le mot de passe est incorrect
            return false;
        }
    }
}

function set_session($profil)
{
    $_SESSION['profil'] = $profil;
}

function set_cookie($profil)
{
    $_COOKIE['profil'] = $profil;
}

function is_connected()
{
    if (empty($_SESSION['profil'])) {
        $url = "index.php?controle=abonne&action=connexionAbonne";
        header("Location:" . $url);
    }
}

function accueilAbonne()
{
    is_connected();
    require("./modele/abonneBD.php");

    $vehicules = array();
    $id = $_SESSION['profil']['id'];

    getVehicules($id, $vehicules);

    require("./vue/abonne/accueilAbonne.tpl");
}

function reservationVehicules()
{
    is_connected();
    require("./modele/abonneBD.php");

    $vehicules = array();
    getAvailableVehicles($vehicules);

    $listeVehicules = isset($_POST['checked']) ? ($_POST['checked']) : '';

    if (count($_POST) == 0) {
        require("./vue/abonne/reservationVehicules.tpl");
    } else {
        $_SESSION['listeVehicules'] = $listeVehicules;
        require("./vue/abonne/formVehicule.tpl");
    }
}


function affichageFactures()
{
    is_connected();
    require("./modele/abonneBD.php");
}

function enregistrerReservation()
{
    is_connected();
    require("./modele/abonneBD.php");

    $idClient = isset($_SESSION['profil']['id']) ? ($_SESSION['profil']['id']) : '';
    $vehicules = isset($_SESSION['listeVehicules']) ? ($_SESSION['listeVehicules']) : '';
    $dateDebut = isset($_POST['dateDebut']) ? ($_POST['dateDebut']) : '';
    $dateFin = isset($_POST['dateFin']) ? ($_POST['dateFin']) : '';

    foreach ($vehicules as $idVehicule) {
        // étape 1 : enregistrer le changement d'état du véhicule
        if (changeVehicleState($idVehicule, $idClient)) {
            // étape 2 : enregistrer la facturation avec date début/ date fin
            if (setNewInvoice($idVehicule, $idClient, $dateDebut, $dateFin)) {
                $url = "index.php?controle=abonne&action=accueilAbonne";
                header("Location:" . $url);
            }
        }
    }
}

function deconnexion()
{
    session_unset();
    session_destroy();
    $url = "index.php?controle=nonAbonne&action=accueil";
    header("Location:" . $url);
}

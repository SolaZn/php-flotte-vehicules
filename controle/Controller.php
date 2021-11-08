<?php

function connexion(){
    $nom = isset($_POST['nom']) ? $_POST['nom'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $mdp = isset($_POST['mdp']) ? $_POST['mdp'] : '';
    $profil = array();
    if (count($_POST) == 0) require("./vue/connexion.tpl");
    else {
        require("./modele/connexion.php");
        $msg = '';
        if(isset($_POST['email'], $_POST['mdp'])){
            // Vérification que email et mdp soit non null
            if(empty($_POST['email']) && empty($_POST['mdp'])) {
               $msg="Champs vide";
            }
            elseif (empty($_POST['email'])){
                die("Adresse mail manquante.");
              
            }
            elseif(empty($_POST['mdp'])){
                die("Mot de passe manquant.");
               
            }
            else {
                if(!verificationLoueur($email,$mdp,$profil)) {
                    die("L'identifiant et/ou le mot de passe sont pas bons");
                  
                }
             
                elseif(verificationLoueur($email,$mdp,$profil)){
                    $idl ='';
                    $_SESSION['profil'] = $profil;
                    foreach ($profil as $pr):
                        $idl = $pr[0];
                        $nom = $pr[1];
                    endforeach;
                    $_SESSION['idl'] = $idl;
                    $_SESSION['noml'] = $nom;
                    // On renvoie à l'espace en tant que connecté "loueur"
                    $url ="index.php?controle=ControllerL&action=connecteL&id=$idl";
                    header("Location:".$url);
                }
                
            }
        }
    }

}
?>
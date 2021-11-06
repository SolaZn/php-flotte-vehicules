<?php

    function connexionAbonne($mode = ""){
        // on récupère les éventuelles informations déjà reçues par POST
        $login= isset($_POST['login'])?($_POST['login']):'';
        $password= isset($_POST['password'])?($_POST['password']):'';

        // on prépare un tableau vide pour stocker les informations de session
        // de l'utilisateur qui se connectera plus tard.
        $profil = array();

        if($mode == "NEW_USER"){
            // remplir les informations de session et procéder à la connexion

            set_session($profil);
            set_cookie($profil);

        } else{        
            if(count($_POST)== 0){
                require("./vue/abonne/connexionAbonne.tpl");
            }
                else {
                    if (verification_login($login, $password)) {        
                        // Ou alors créer un tableau qui comporte les 
                        // deux informations à transmettre
                        
                        set_session($profil);
                        set_cookie($profil);
                        
                        $url = "index.php?controle=abonne&action=accueilAbonne";
                        header("Location:". $url);
                        //on peut éventuellement utiliser cURL ou JSON pour
                        // transmettre avec POST nos informations
        
                        // Plus besoin de créer une URL paramétrique puisque
                        // désormais les variables ne sont plus transmises 
                        // par méthode POST ou GET mais à travers le fichier
                        // contenant les variables de session
                    }else{
                        require("./vue/abonne/connexionAbonne.tpl");
                    }
                }
            }
        }
    

    function verification_login($login, $password){        
        require("./modele/abonneBD.php"); // comme un include

        $hash = array();
        if(getHash($login, $hash)){
            if(password_verify($password, $hash['mdp'])){
                // si le mot de passe est bon
                $profil = array();
                getCredentials($login, $profil);
                echo("bonjour");
                return true;
            }else{
                // si le mot de passe est incorrect
                    var_dump($hash);
                var_dump($password);
                var_dump($login);
                echo("au revoir");
                return false;
            }
        }
    }

    function set_session($profil){
        $_SESSION['profil'] = $profil;
    }

    function set_cookie($profil){
        $_COOKIE['profil'] = $profil;
    }
?>
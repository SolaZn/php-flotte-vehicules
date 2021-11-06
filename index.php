<?php
        session_start ();
        
        if ((count($_GET)!=0) && !(isset($_GET['controle']) && isset ($_GET['action'])))
        require ('./vue/erreur404.tpl'); 
        
        else {
            if ((! isset($_SESSION['profil'])) || count($_GET)==0)	{ 
                $controle='abonne';
                $action='connexionAbonne';	
                if (isset($_GET['action'])){
                    $action = $_GET['action'];
                }
            }
            else {
                if (isset($_GET['controle']) && isset ($_GET['action'])) {
                    $controle = $_GET['controle'];   
                    $action =  $_GET['action'];
                }
            }
            require ('./controle/' . $controle . '.php');
            $action();
        } 

?>
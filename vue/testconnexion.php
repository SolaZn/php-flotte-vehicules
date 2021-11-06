<?php
    require('./modele/connectBD.php');
    require('./modele/abonneBD.php');
    $nom = "marjeaCAPA";
    $password = "iutparisrivesdeseine"; 
            

        $hash = "";
        getHash($nom, $hash);
        

            echo("Comparons : ");
            echo ($password);
            echo("<br>");
            echo("Avec :");
            echo ($hash['mdp']);  
            echo("<br>");

            if(password_verify($password, $hash['mdp'])){
                echo('Le mot de passe hashé et le mot de passe en clair (à ne jamais stocker) correspondent !');
            }else{
                echo('Le mot de passe hashé (à stocker en table) et le mot de passe en clair (à ne jamais stocker) ne correspondent pas !');
            }
			return true;
?>
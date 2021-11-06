<?php
    require('./modele/connectBD.php');
    
    $nom = "MARTIN Jeanne";
    $password = "iutparisrivesdeseine"; 
  
    $sql="SELECT * FROM `client` WHERE nom=:nom";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':nom', $nom);
			$bool = $commande->execute();
			if ($bool) 
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
		
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage());
			die(); 
		}

		if (count($resultat) == 0) {
			$profil = array(); 
			return false; 
		}
		else {
			$profil = $resultat[0]; 
            
            echo("Comparons : ");
            echo ($password);
            echo("<br>");
            echo("Avec :");
            echo ($profil['mdp']);  
            echo("<br>");

            if(password_verify($password, $profil['mdp'])){
                echo('Le mot de passe hashé et le mot de passe en clair (à ne jamais stocker) correspondent !');
            }else{
                echo('Le mot de passe hashé (à stocker en table) et le mot de passe en clair (à ne jamais stocker) ne correspondent pas !');
            }
			return true;
		}


?>
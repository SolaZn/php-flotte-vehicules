<?php

	function accueil(){
		$listeVoit=array();
		require ("./modele/nonAbonneBD.php");	

		voitDisp($listeVoit);
		$_SESSION['listeVoit']=$listeVoit;
		require("./vue/accueil/accueil.tpl");
		
	}
	
	function inscription() {
		$nom = isset($_POST['nom'])?($_POST['nom']):'';
		$mdp = isset($_POST['mdp'])?($_POST['mdp']):'';
		$email= isset($_POST['email'])?($_POST['email']):'';
		$pseudo= isset($_POST['pseudo'])?($_POST['pseudo']):'';
		$denomEnt= isset($_POST['denomEnt'])?($_POST['denomEnt']):'';
		$adresseEnt= isset($_POST['adresseEnt'])?($_POST['adresseEnt']):'';
		
		$msg ='';

		if  (count($_POST)==0)
			require ("./vue/accueil/inscription.tpl");

		else {
			$profil = array();

			require("./modele/nonAbonneBD.php");

			if(verifEmailIns($email,$profil)) { //verifier si le mail existe deja dans la bd
				$msg ="cet email existe déjà";
				require ("./vue/accueil/inscription.tpl") ;
			}
			elseif (verifPseudoIns($pseudo,$profil)){
				$msg ="ce pseudo existe déjà";
				require ("./vue/accueil/inscription.tpl") ;
			}	
			else { 
				if(isset($_POST['nom'], $_POST['mdp'], $_POST['adresseEnt'], $_POST['denomEnt'], $_POST['pseudo'], $_POST['email'])){
					// verifier que les champs ne sont pas vides
					if(empty($_POST['nom'])){
						$msg = "Le champ nom est vide";
						require ("./vue/accueil/inscription.tpl") ;
					} 
					elseif(empty($_POST['mdp'])){
						$msg = "Le champ mot de passe est vide";	
						require ("./vue/accueil/inscription.tpl") ;
					}
					elseif(empty($_POST['pseudo'])){
						$msg = "Le champ pseudo est vide";	
						require ("./vue/accueil/inscription.tpl") ;
					}
					elseif(empty($_POST['adresseEnt'])){
						$msg = "Le champ adresse est vide";	
						require ("./vue/accueil/inscription.tpl") ;
					}					
					elseif(empty($_POST['denomEnt'])){
						$msg = "Le champ nom de l'entreprise est vide";	
						require ("./vue/accueil/inscription.tpl") ;
					}
					elseif(empty($_POST['email'])){
						$msg = "Le champ email est vide";	
						require ("./vue/accueil/inscription.tpl") ;
					}
					
					// Seulement les lettres et l'espace sont accepté !
					elseif(!preg_match("/^[a-zA-Z ]{1,20}$/",$_POST['nom'])){ 
						$msg = "Seulement les lettres et l'espace sont acceptés dans le champ  nom!";
						require ("./vue/accueil/inscription.tpl") ;
					}
					
					elseif(!preg_match("/([\w\-]+\@[\w\-]+\.[\w\-]+)/",$_POST['email'])){
						$msg = "La forme de l'email est incorrecte";
						require ("./vue/nonAbonne/inscription.tpl") ;
					}
					//le mot de passe doir etre compris entre 8 et 10 caracteres
					elseif(strlen($_POST['mdp'])>10 && strlen($_POST['mdp'])<8){ 
						$msg = "La longueur mot de passe  doit être compris entre 8 et 10 caractères";
						require ("./vue/accueil/inscription.tpl") ;
					} 
				
					else {
						$hash = password_hash($mdp, PASSWORD_DEFAULT);
						
						if(!ajouter_persone($nom, $hash, $pseudo, $email, $adresseEnt, $denomEnt)){ 
							$msg = "Une erreur s'est produite. ";
							require ("./vue/accueil/inscription.tpl") ;
						} 
						else {
							$msg = ("Votre inscription est reussie !"); 
							require('./controle/abonne.php');
							require('./modele/abonneBD.php');

							$profil = array();

							getCredentials($pseudo, $profil);

							set_session($profil);
							echo '<script>
							var timer = setTimeout(function() {
								window.location=\'index.php?controle=abonne&action=accueilAbonne\'}, 3000);
							</script>';
						}
					}
				}
				
			}
		}	
		
	}



?>
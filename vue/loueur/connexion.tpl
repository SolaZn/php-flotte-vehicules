<!doctype html>
<?php 
$msg= NULL
?>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" href="./vue/StyleCSS/connexion.css"/>
		<link rel="stylesheet" href="./vue/StyleCSS/bootstrap.css"/>
		<!-- <script src="script.js"></script> -->
		<title>La Garagerie - Connexion</title>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
  			<a class="navbar-brand" href="index.php?controle=Controller&action=index">La Garagerie</a>
			<div class="collapse navbar-collapse" id="navbarColor02">
    			<ul class="navbar-nav mr-auto">
      				<li class="nav-item active">
        				<a class="nav-link" href="index.php?controle=Controller&action=index">Home</a>
      				</li>
      				<li class="nav-item">
        				<a class="nav-link" href="index.php?controle=Controller&action=inscript">S'inscrire</a>
      				</li>
      				<li class="nav-item">
        				<a class="nav-link" href="index.php?controle=Controller&action=connexion">Se connecter</a>
     				 </li>
    			</ul>
 			</div>
		</nav>
		<div class="fy">
			<h1>Connexion à votre espace</h1>
			<form controle=Controller&action=connexion method="post">
				<h3>Email</h3>
				<input class="input-box" placeholder="Email" type="email" name="email" value="" /> </br>
				<h3>Mot de passe</h3>
				<input class="input-box" placeholder="Mot de passe" type="password" name="mdp" value="" /> </br>
				<button type= "submit" class="login-btn" id='valider'  value= "Se connecter">Se connecter</button></br>
				
			</form>
		</div>
	</body>
</html>
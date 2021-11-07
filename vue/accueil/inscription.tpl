<?php
	$no=htmlspecialchars($nom); 
	$md=htmlspecialchars($mdp); 
	$pseud=htmlspecialchars($pseudo);
	$denom=htmlspecialchars($denomEnt);
	$adresse=htmlspecialchars($adresseEnt);
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>La Garagerie - Inscription</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="./vue/abonne/assets/css/Login-Form-Clean.css">
</head>

<body style="overflow: hidden !important;">
    <nav class="navbar navbar-light navbar-expand-md">
        <div class="container-fluid" style="gap: 15px;"><a href="index.php?controle=nonAbonne&action=accueil"><img
                    src="./vue/content/images/logo.png" height="45"></a>
            <span>Inscription</span><button data-bs-toggle="collapse" data-bs-target="#navcol-1"
                class="navbar-toggler"><span class="visually-hidden">Toggle navigation</span><span
                    class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse d-xl-flex justify-content-xl-center" id="navcol-1">
            </div>
    </nav>

    <section class="login-clean" style="width: 100%;height: 950px;background: var(--bs-green)">
		<?php if(!empty($msg)){
			echo '<div role="alert" class="alert alert-warning d-xl-flex justify-content-xl-center"><span><strong>' . $msg . '</strong></span></div>';
		}
		?>


        <form method="post" action="index.php?controle=nonAbonne&action=inscription">
            <h2 class="visually-hidden">Login Form</h2>
            <div class="illustration"><img src="./vue/content/images/logo.png"></div>
            <div class="mb-3"><input class="form-control" name="nom" type="text" placeholder="Nom" required
                    value="<?php echo($no); ?>" /></div>
            <div class="mb-3"><input class="form-control" name="pseudo" type="text" placeholder="Pseudo" required
                    value="<?php echo($pseud) ?>" /></div>
            <div class="mb-3"><input class="form-control" name="mdp" type="password" placeholder="Mot de passe" /></div>
			<div class="mb-3"><input class="form-control" name="email" type="email" placeholder="Email"/></div>
            <div class="mb-3"><input class="form-control" name="denomEnt" type="text"
                    placeholder="Nom de votre entreprise" required value="<?php echo($denom) ?>" /></div>
            <div class="mb-3"><input class="form-control" name="adresseEnt" type="text" placeholder="Adresse" required
                    value="<?php echo($adresse) ?>" /></div>

            <div class="mb-3"><button class="btn btn-primary d-block w-100" type="submit"
                    style="background: var(--bs-blue)">S'inscrire</button></div>
            <div class="mb-3"><a class="btn btn-warning w-100 text-muted"
                    href="index.php?controle=abonne&action=connexionAbonne" role="button"
                    style="color: white !important;">Déjà client ?</a></div>
            <div class="mb-3"><a class="btn btn-secondary w-100" href="index.php?controle=nonAbonne&action=accueil"
                    role="button">Retour</a></div>

        </form>
    </section>
</body>

</html>
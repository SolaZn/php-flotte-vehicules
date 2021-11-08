<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>La Garagerie - Connexion</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="./vue/abonne/assets/css/Login-Form-Clean.css">
</head>

<body style="overflow:hidden !important;">
    <nav class="navbar navbar-light navbar-expand-md">
        <div class="container-fluid" style="gap: 15px;"><a href="index.php?controle=nonAbonne&action=accueil"><img src="./vue/content/images/logo.png" height="45"></a>
        <span>Connexion</span><button data-bs-toggle="collapse" data-bs-target="#navcol-1" class="navbar-toggler"><span
                    class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse d-xl-flex justify-content-xl-center" id="navcol-1">
        </div>
    </nav>
    <section class="login-clean" style="width: 100%;height: 950px;background: var(--bs-purple)">
        <form method="post" action="index.php?controle=loueur&amp;action=connexionLoueur">
            <h2 class="visually-hidden">Login Form</h2>
            <div class="illustration"><img src="./vue/content/images/logo.png"></div>
            <div class="alert alert-warning d-xl-flex justify-content-xl-center" style="text-align: center;">Vous vous connectez en tant que loueur</div>
            <div class="mb-3"><input class="form-control" placeholder="Email" type="email" name="email" value="" required=""/></div></div>
            <div class="mb-3"><input class="form-control" placeholder="Mot de passe" type="password" name="mdp" value="" required=""/> </div>
            <div class="mb-3"><button class="btn btn-primary d-block w-100" type="submit" style="background: var(--bs-blue)">Connexion</button></div>
            <div class="mb-3"><a class="btn btn-secondary w-100" href="index.php?controle=nonAbonne&action=accueil" role="button">Retour</a></div>
        </form>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
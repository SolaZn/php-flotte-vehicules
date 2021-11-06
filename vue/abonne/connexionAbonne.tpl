<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Accueil</title>
    <link rel="stylesheet" href="./vue/abonne/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="./vue/abonne/assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="./vue/abonne/assets/css/Login-Form-Clean.css">
</head>

<body>
    <nav class="navbar navbar-light navbar-expand-md">
        <div class="container-fluid"><a class="navbar-brand" href="#">Brand</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link active" href="#">First Item</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Second Item</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Third Item</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="login-clean" style="width: 100%;height: 100%;background: var(--bs-pink);">
        <form method="post" action="index.php?controle=abonne&amp;action=connexionAbonne">
            <h2 class="visually-hidden">Login Form</h2>
            <div class="illustration"><i class="icon ion-ios-navigate"></i></div><input class="form-control" type="text" name="login" placeholder="Login" required="">
            <div class="mb-3"></div>
            <div class="mb-3"><input class="form-control" type="password" name="password" placeholder="Mot de passe" required=""></div>
            <div class="mb-3"><button class="btn btn-primary d-block w-100" type="submit">Connexion</button></div>
        </form>
    </section>
    <script src="./vue/abonne/assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
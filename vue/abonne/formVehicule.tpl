<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>La Garagerie - Enregistrement d'une réservation</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="./vue/abonne/assets/css/Login-Form-Dark.css">
</head>

<body style="overflow:hidden;">
    <nav class="navbar navbar-light navbar-expand-md">
        <div class="container-fluid" style="gap: 15px;"><a href="index.php?controle=abonne&amp;action=accueilAbonne"><img src="./vue/content/images/logo.png" height="45"></a><small>
                <?php echo $_SESSION['profil']['nom'] . '<br>' . $_SESSION['profil']['denomEnt']; ?>
            </small><button data-bs-toggle="collapse" data-bs-target="#navcol-1" class="navbar-toggler"><span
                    class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse d-xl-flex justify-content-xl-center" id="navcol-1">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link active" href="#">Véhicules</a></li>
                    <li class="nav-item"><a class="nav-link"
                            href="#">Facturation</a></li>
                    <li class="nav-item"></li>
                </ul>
            </div><a class="btn btn-primary" role="button" href="index.php?controle=abonne&amp;action=deconnexion"
                style="background: var(--bs-red); outline:0 !important; box-shadow: none !important; ">Se déconnecter</a>
        </div>
    </nav>
    <div class="card">
        <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs">
                <li class="nav-item"><a class="nav-link"
                        href="index.php?controle=abonne&amp;action=accueilAbonne">Véhicules en cours de location</a>
                </li>
                <li class="nav-item"><a class="nav-link active" href="#">Réservation de véhicules</a></li>
            </ul>
        </div>
        <section class="login-dark" style="background: var(--bs-blue); height:46.9vw;">
            <form method="post" action="index.php?controle=abonne&amp;action=enregistrerReservation">
                <h2 class="visually-hidden">Login Form</h2><span class="d-xl-flex justify-content-xl-center"
                    style="font-size: 2em;align-self: center;">Réservation</span>
                <div class="mb-3"><label class="form-label">Date de début</label><input class="form-control" type="date" name="dateDebut"
                        required=""></div>
                <div class="mb-3"><label class="form-label">Date de fin</label><input class="form-control" type="date" name="dateFin">
                </div>
                <div class="mb-3"><button class="btn btn-primary d-block w-100" type="submit">Réserver</button></div>
                <div class="mb-3"><a class="btn btn-danger d-block w-100" href="index.php?controle=abonne&amp;action=reservationVehicules">Annuler la réservation</a></div>

            </form>
        </section>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
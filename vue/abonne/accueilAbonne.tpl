<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Accueil</title>
    <link rel="stylesheet" href="./vue/abonne/assets/bootstrap/css/bootstrap.min.css">
</head>

<body>
    <nav class="navbar navbar-light navbar-expand-md">
        <div class="container-fluid"><a class="navbar-brand" href="#">Brand</a><span>
                <?php echo $_SESSION['profil']['nom']; ?>
            </span><button data-bs-toggle="collapse" data-bs-target="#navcol-1" class="navbar-toggler"><span
                    class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse d-xl-flex justify-content-xl-center" id="navcol-1">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link active" href="#">Véhicules</a></li>
                    <li class="nav-item"><a class="nav-link"
                            href="index.php?controle=abonne&amp;action=affichageFactures">Facturation</a></li>
                    <li class="nav-item"></li>
                </ul>
            </div><a class="btn btn-primary" role="button" href="index.php?controle=abonne&amp;action=deconnexion"
                style="background: var(--bs-pink);">Se déconnecter</a>
        </div>
    </nav>
    <div class="card">
        <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs">
                <li class="nav-item"><a class="nav-link active" href="#">Véhicules en cours de location</a></li>
                <li class="nav-item"><a class="nav-link"
                        href="index.php?controle=abonne&amp;action=reservationVehicules">Réservation de véhicules</a>
                </li>
            </ul>
        </div>

        <div class="card-body">
            <h4 class="card-title">Véhicules en cours de location</h4>
            <p class="card-text">Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac
                facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus.</p>
            <div class="row row-cols-3 row-cols-md-6 g-9">
                <?php
                                    if(!empty($vehicules)){
                                        foreach($vehicules as $vehicule){
                                            $specs = array();
                                            $specs = json_decode($vehicule['specs'], true);

                                            echo '<div class="col"><div class="card">';
                                            echo '<img class="card-img-top" src="'. $vehicule['image'] . '" style=\'max-height:150px; max-width:150px;\'">
                                                    <h4 class="card-title">' . $vehicule['type'] . '</h4>';
                                            echo '<p class="card-text"> Prix : ' . $specs['prix']. '€/jour</p>';
                                            echo '</div></div>';
                                        }
                                    }
                                ?>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
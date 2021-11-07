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
        <div class="container-fluid" style="gap: 15px;"><a
                href="index.php?controle=abonne&amp;action=accueilAbonne"><img src="./vue/content/images/logo.png"
                    height="45"></a><span>
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
                style="background: var(--bs-red); outline:0 !important; box-shadow: none !important; ">Se
                déconnecter</a>
        </div>
    </nav>
    <div class="page">
        <div class="card">
            <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs">
                    <li class="nav-item"><a class="nav-link active" href="#">Véhicules en cours de location</a></li>
                    <li class="nav-item"><a class="nav-link"
                            href="index.php?controle=abonne&amp;action=reservationVehicules">Réservation de
                            véhicules</a>
                    </li>
                </ul>
            </div>

            <div class="card-body">
                <h1 class="text-center card-title">Véhicules en cours de location</h1>
                <!-- <p class="card-text">Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac
                    facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus.</p> -->
                <?php 
                        if(!empty($vehicules)){
                            echo '<div class="container-fluid d-flex flex-row flex-wrap justify-content-xl-center" style="gap:30px">';

                            foreach($vehicules as $vehicule){
                                $specs = array();
                                $specs = json_decode($vehicule['specs'], true);

                                echo '<div class="card mb-3" style="max-width: 540px;">';
                                echo '<div class="row g-0" >';
                                echo '<div class="col-md-4" style="overflow: hidden;">';
                                echo '<img src="'. $vehicule['image'] . '" class="img-fluid rounded-start" alt="Photo de ' . $vehicule['type'] . '" style="min-width: 145%;">';
                                echo '</div>';
                                echo '<div class="col-md-8"><div class="card-body">';
                                echo '<h5 class="card-title">' . $vehicule['type'] . '</h5>';
                                echo '<p class="card-text">' . $specs['moteur'] . '</p>';
                                echo '</div></div></div></div>';
                            }

                            echo '</div>';

                        }else{
                            echo '<div role="alert" class="alert alert-warning d-xl-flex justify-content-xl-center"><span><strong>Aucun véhicule en location actuellement</strong></span></div>';
                        }
                    ?>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
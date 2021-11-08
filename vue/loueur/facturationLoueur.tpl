<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./vue/StyleCSS/loueur.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">

    <script src="https://kit.fontawesome.com/228973d50f.js" crossorigin="anonymous"></script>
    <title>Espace loueur - La Garagerie</title>
</head>

<body>
    <nav class="bg-dark navbar navbar-light navbar-expand-md" style="position:fixed; width:100%;">
        <div class="container-fluid" style="gap: 15px;"><a
                href="index.php?controle=nonAbonne&amp;action=accueil"><img src="./vue/content/images/logo.png"
                    height="45"></a><small>
            </small><button data-bs-toggle="collapse" data-bs-target="#navcol-1" class="navbar-toggler"><span
                    class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        </div><a class="btn btn-primary" role="button" href="index.php?controle=loueur&amp;action=deconnexion"
            style="background: var(--bs-red); outline:0 !important; box-shadow: none !important; ">Déconnexion</a>
        </div>
    </nav>

<div style="margin: 20px;">
        <table class="table table-striped table-success table-hover table-sm table-bordered caption-top">
		  <caption>Liste des véhicules en cours de location</caption>

            <thead>
                <tr>
                    <th>Nom de l'entreprise</th>
                    <th>Nom du véhicule</th>
                    <th>Type de moteur</th>
                    <th>Type de boîte de vitesse</th>
                    <th>Date de début de location</th>
                    <th>Date de fin de location</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($vlocations as $vlocation): $specs2 = array(); $specs2 = json_decode($vlocation['specs'], true);?>
                <tr>
                    <td>
                        <?= $vlocation['denomEnt']?>
                    </td>
                    <td>
                        <?= $vlocation['type'] ?>
                    </td>
                    <td>
                        <?= $specs2['moteur'] ?>
                    </td>
                    <td>
                        <?= $specs2['boite'] ?>
                    </td>
                    <td>
                        <?= $vlocation['dateDebut'] ?>
                    </td>
                    <td>
                        <?= $vlocation['dateFin'] ?>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</body>
</html>
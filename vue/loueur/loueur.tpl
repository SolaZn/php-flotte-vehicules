<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./vue/StyleCSS/loueur.css" />
    <link rel="stylesheet" href="./vue/StyleCSS/bootstrap.css" />
    <link rel="stylesheet" href="./vue/abonne/assets/bootstrap/css/bootstrap.min.css">

    <script src="https://kit.fontawesome.com/228973d50f.js" crossorigin="anonymous"></script>
    <title>La Garagerie</title>
</head>

<body>
    <nav class="navbar navbar-light navbar-expand-md">
        <div class="container-fluid" style="gap: 15px;"><a
                href="index.php?controle=abonne&amp;action=accueilAbonne"><img src="./vue/content/images/logo.png"
                    height="45"></a><small>
            </small><button data-bs-toggle="collapse" data-bs-target="#navcol-1" class="navbar-toggler"><span
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

    <h2>Bienvenue loueur
        <?php echo $_SESSION['nom'] ?>
    </h2>
    <h4>Vos véhicules</h4>
    <div style="border-style: solid; width:850px; height:500px; overflow:auto;margin-right: auto;margin-left: auto;">
        <table class=" table table-striped">
            <thead>
                <tr>
                    <th>Nom du véhicule</th>
                    <th>Type de moteur</th>
                    <th>Type de boîte de vitesse</th>
                    <th>Nombre de places</th>
					<th>Prix (par jour)</th>
                    <th>Etat (numéro client OU état stock)</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($voitures as $voiture): 
					$specs = array();
					$specs = json_decode($voiture['specs'], true);?>
                <tr>
                    <td>
                        <?= $voiture['type'] ?>
                    </td>
                    <td>
                        <?= $specs['moteur'] ?>
                    </td>
                    <td>
                        <?= $specs['boite'] ?>
                    </td>
                    <td>
                        <?= $specs['places'] ?>
                    </td>
					<td>
                        <?= $specs['prix'] ?> €
                    </td>
                    <td>
                        <?= $voiture['etat'] ?>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <input type="checkbox" id="click">
    <label for="click" class="show">Ajouter un véhicule</label>

    <div class="ajouter" name="formulaire">
        <form action="index.php?controle=loueur&action=ajout" method="post">
            <label for="click" class="close-btn fas fa-times"></label>
            <h3>Ajouter un véhicule</h3>
            <input class="input-box" placeholder="Nom du véhicule" type="text" name="type" value="" /><br>
            <select name="energie">
                <option value=""> Type de moteur </option>
                <option value="électrique"> électrique </option>
                <option value="hybride"> hybride </option>
				<option value="essence"> essence </option>
				<option value="diesel"> diesel </option>
            </select><br>
            <select name="boite">
                <option value="">Type de boîte de vitesse </option>
                <option value="manuelle">manuelle </option>
                <option value="automatique">automatique </option>
            </select><br>
            <input class="input-box" placeholder="Nombre de places" type="text" name="places" value="" /><br>
            <select name="location">
                <option value="disponible">Disponible</option>
                <option value="en_révision">En révision</option>
            </select><br>
			<input class="input-box" placeholder="Prix par jour" type="text" name="prix" /><br>
            <input class="input-box" placeholder="Nom du fichier photo" type="test" name="photo" /><br>
            <button type="submit" class="add-btn">Ajouter</button>
        </form>
    </div>

    <input type="checkbox" id="clickr">
    <label for="clickr" class="showr">Retirer un véhicule</label>
    <div class="retirer">
        <form action="index.php?controle=ControllerL&action=retrait" method="post">
            <label for="clickr" class="close-btn fas fa-times"></label>
            <h3>Retirer un véhicule</h3>
            <select name="retraitnom" size="1">
                <?php foreach($voitures as $voiture):?>
                <option>
                    <?= $voiture['type']?>
                    <?php endforeach; ?>
            </select>
            <input type="submit" class="supp-btn" name="supp-btn" value="Retirer">
        </form>
    </div>

    <input type="checkbox" id="clickc">
    <label for="clickc" class="showc">Changer l'état d'une voiture</label>
    <div class="changeEtatd">
        <form action="index.php?controle=loueur&action=changerEtatVehicule" method="post">
            <label for="clickc" class="close-btn fas fa-times"></label>
            <h3>Changer l'état d'une voiture</h3>
            <select name="type_v" size="1">
                <?php foreach($vehicules as $voiture):?>
                <option>
                    <?= $voiture['type']?>
                    <?php endforeach; ?>
            </select><br>
            <select name="location">
                <option value="disponible">Disponible</option>
                <option value="en_révision">En révision</option>
            </select>

            <input type="submit" value="Modifier">
        </form>
    </div>


    <h4> Voitures louées par les clients </h4>
    <div
        style="margin-bottom: 10px;border-style: solid;width:1100px; height:300px; overflow:auto;margin-right: auto;margin-left: auto;">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Nom de l'entreprise</th>
                    <th>Nom du véhicule</th>
                    <th>Type de moteur</th>
                    <th>Type de boîte de vitesse</th>
                    <th>Disponibilité des véhicules</th>
                    <th>Date de début de location</th>
                    <th>Date de fin de location</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($vlocations as $vlocation): ?>
                <tr>

                    <td>
                        <?= $vlocation['nom_c']?>
                    </td>
                    <td>
                        <?= $vlocation['type_v'] ?>
                    </td>
                    <td>
                        <?= $vlocation['energie_v'] ?>
                    </td>
                    <td>
                        <?= $vlocation['boite_v'] ?>
                    </td>
                    <td>
                        <?= $vlocation['location_v'] ?>
                    </td>
                    <td>
                        <?= $vlocation['dateD'] ?>
                    </td>
                    <td>
                        <?= $vlocation['dateF'] ?>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</body>

</html>
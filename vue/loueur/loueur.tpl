<!doctype html>
<html>

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

	<br>
	<br>
    <h1 style="text-align: center;">Bienvenue dans l'espace Loueur
    </h1>

	<input type="checkbox" id="click">
	<label for="click" class="show text-wrap badge bg-success" style="color: white; height: 15%;">Ajouter un véhicule</label>
    
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
    <label for="clickr" class="showr text-wrap badge bg-danger" style="color: white; height: 15%;">Retirer un véhicule</label>
    <div class="retirer">
        <form action="index.php?controle=loueur&action=retrait" method="post">
            <label for="clickr" class="close-btn fas fa-times"></label>
            <h3>Retirer un véhicule</h3>
            <select name="id" size="1">
                <?php foreach($vehicules as $voiture){
					echo '<option value="' . $voiture['id'] . '">' . $voiture['id'] . ' | '. $voiture['type'] . '</option>';
				}?>
            </select>
            <input type="submit" class="supp-btn" name="supp-btn" value="Retirer">
        </form>
    </div>

    <input type="checkbox" id="clickc">
    <label for="clickc" class="showc text-wrap badge bg-dark" style="color: white; height: 15%;">Changer l'état d'une voiture</label>
    <div class="changeEtatd">
        <form action="index.php?controle=loueur&action=changerEtatVehicule" method="post">
            <label for="clickc" class="close-btn fas fa-times"></label>
            <h3>Changer l'état d'une voiture</h3>
            <select name="id" size="1">
                <?php foreach($vehicules as $voiture){
					echo '<option value="' . $voiture['id'] . '">' . $voiture['id'] . ' | '. $voiture['type'] . '</option>';
				}?>
            </select><br>
            <select name="location">
                <option value="disponible">Disponible</option>
                <option value="en_revision">En révision</option>
            </select>

            <input type="submit" value="Modifier">
        </form>
    </div>


    <h2 style="text-align:center; text-decoration:underline;"> Véhicules actuellement en stock</h4>
    <div style="margin: 20px;">
        <table class="table table-striped table-secondary table-hover table-sm table-bordered caption-top">
            <caption>Liste des véhicules en stock (quelque soit le statut)</caption>
            <thead>
                <tr>
                    <th>Identifiant du véhicule</th>
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
                        <?= $voiture['id'] ?>
                    </td>
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

    <h2 style="text-align:center; text-decoration:underline;"> Voitures louées par les clients </h4>
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
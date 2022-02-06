<?php
	$hostname = "localhost";	
	$base= "BDD_lagaragerie";
	$loginBD= "root";	
	$passBD="";
	
	$cleardb_url = parse_url(getenv("CLEARDB_DATABASE_URL"));
	$cleardb_server = $cleardb_url["host"];
	$cleardb_username = $cleardb_url["user"];
	$cleardb_password = $cleardb_url["pass"];
	$cleardb_db = substr($cleardb_url["path"],1);

	try {
		$dsn = "mysql:server=$cleardb_server ; dbname=$cleardb_db";
		$pdo = new PDO ($dsn, $cleardb_username, $cleardb_password, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
		$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	}
	catch (PDOException $e) {
		echo utf8_encode("Echec de connexion : " . $e->getMessage());
		die();
	}
?>
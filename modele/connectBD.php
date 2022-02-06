<?php
	/*$hostname = "localhost";	
	$base= "BDD_lagaragerie";
	$loginBD= "root";	
	$passBD="";
	
	$cleardb_url = parse_url(getenv("CLEARDB_DATABASE_URL"));
	$cleardb_server = $cleardb_url["host"];
	$cleardb_username = $cleardb_url["user"];
	$cleardb_password = $cleardb_url["pass"];
	$cleardb_db = substr($cleardb_url["path"],1);
	
	$active_group = 'default';
	$query_builder = TRUE;

	try {
		$dsn = "mysql:server=". $cleardb_server.";dbname=". $cleardb_db;
		$pdo = new PDO ($dsn, $cleardb_username, $cleardb_password);
		$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	}
	catch (PDOException $e) {
		echo $dsn;
		echo utf8_encode("Echec de connexion : " . $e->getMessage());
		die();
	}
	/*
	$conn = mysqli_connect($cleardb_server, $cleardb_username, $cleardb_password, $cleardb_db);

	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	  }*/
	
	$url = parse_url(getenv("CLEARDB_DATABASE_URL"));

$server = $url["host"];
$username = $url["user"];
$password = $url["pass"];
$db = substr($url["path"], 1);

$conn = new mysqli($server, $username, $password, $db);

?>
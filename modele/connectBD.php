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
	
	echo(getenv("CLEARDB_DATABASE_URL"));

	$active_group = 'default';
	$query_builder = TRUE;

	/*try {
		$dsn = "mysql:server=$cleardb_server;dbname=$cleardb_db";
		$pdo = new PDO ($dsn, $cleardb_username, $cleardb_password, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
		$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	}
	catch (PDOException $e) {
		echo $dsn;
		echo utf8_encode("Echec de connexion : " . $e->getMessage());
		die();
	}*/
	$conn = mysqli_connect($cleardb_server, $cleardb_username, $cleardb_password, $cleardb_db);

	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	  }

?>
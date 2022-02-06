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
	
/*	$url = parse_url(getenv("CLEARDB_DATABASE_URL"));

$server = $url["host"];
$username = $url["user"];
$password = $url["pass"];
$db = substr($url["path"], 1);

$conn = new mysqli($server, $username, $password, $db);
$pdo = new PDO ("mysql:server=".$server.";dbname=".$db, $username, $password);*/
$dbstr = getenv('CLEARDB_DATABASE_URL');

$dbstr = substr("$dbstr", 8);
$dbstrarruser = explode(":", $dbstr);

//Please don't look at these names. Yes I know that this is a little bit trash :D
$dbstrarrhost = explode("@", $dbstrarruser[1]);
$dbstrarrrecon = explode("?", $dbstrarrhost[1]);
$dbstrarrport = explode("/", $dbstrarrrecon[0]);

$dbpassword = $dbstrarrhost[0];
$dbhost = $dbstrarrport[0];
$dbport = $dbstrarrport[0];
$dbuser = $dbstrarruser[0];
$dbname = $dbstrarrport[1];

unset($dbstrarrrecon);
unset($dbstrarrport);
unset($dbstrarruser);
unset($dbstrarrhost);

unset($dbstr);
/*  //Uncomment this for debug reasons
echo $dbname . " - name<br>";
echo $dbhost . " - host<br>";
echo $dbport . " - port<br>";
echo $dbuser . " - user<br>";
echo $dbpassword . " - passwd<br>";
*/
$dbanfang = 'mysql:host=' . $dbhost . ';dbname=' . $dbname;
$pdo = new PDO($dbanfang, $dbuser, $dbpassword);
//You can only use this with the standard port!

?>
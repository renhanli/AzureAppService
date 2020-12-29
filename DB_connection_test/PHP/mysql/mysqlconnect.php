<?php
$host = $argv[1];
$username = $argv[2];
$password = $argv[3];
$db_name = $argv[4];


//Initializes MySQLi
$conn = mysqli_init();

mysqli_ssl_set($conn,NULL,NULL, "BaltimoreCyberTrustRoot.crt.pem", NULL, NULL);

// Establish the connection
mysqli_real_connect($conn, $host, $username, $password, $db_name, 3306, MYSQLI_CLIENT_SSL);

//If connection failed, show the error
if (mysqli_connect_errno($conn))
{
    die('Failed to connect to MySQL: '.mysqli_connect_error());
}else{
    echo 'Successfully connect to MySQL. ';
}

?>

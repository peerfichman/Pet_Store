<?php
$dbhost = "localhost";
$dbuser = "root";
$dbpass = "peerFikhman10$$";
$dbname = "pet_store";
$connection = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
if (mysqli_connect_errno()) {
    die("DB connection failed: ");
}

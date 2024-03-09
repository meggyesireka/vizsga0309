<?php
  //Adatbázis adatok a kapcsolat létrehozásához
  $servername = "localhost";
  $username = "root";
  $password = "";
  $dbname = "dbprimary";


  $conn = mysqli_connect($servername, $username, $password, $dbname); // kapcsolat létrehozása

  // kapcsolódás ellenőrzése
  if ($conn->connect_error) {
    die("Sikertelen kapcsolódás: " . $conn->connect_error); // sikertelen kapcsolódás
  } else {
  }
?>
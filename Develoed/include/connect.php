<?php
Class Connection{
private $host = "localhost";
private $dbusername = "root";
private $dbpassword = "";
private $dbname = "dbprimary";
// Kapcsolódás az adatbázishoz
public function open(){
    try{$conn = new mysqli ($host, $dbusername, $dbpassword, $dbname);mysqli_select_db($conn, $dbname);return $conn;}
    catch(PDOExpection){echo "Probléma a kapcsolódással!";}}
//Kapcsolat bontása
public function close(){$this->conn = null;}
}
?>
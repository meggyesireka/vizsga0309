<?php
Class Connection{
private $server = "mysql:host=localhost;dbname=dbprimary";
private $username = "root";
private $password = "";
private $options  = array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,);
//private $dbname = "dbprimary";
protected $conn;
// Kapcsolódás az adatbázishoz
public function open(){
    try{$this->conn = new PDO ($this->server, $this->username,$this->password,$this->options);
        //mysqli_select_db($this->conn, $this->dbname)
        ;return $this->conn;}
    catch(PDOExpection $e){echo "Probléma a kapcsolódással!" .$e->getMessage();}}
//Kapcsolat bontása
public function close(){$this->conn = null;}
}
$pdo = new Connection();
?>
<?php
session_start();
include('connect.php');
include('resetcodegen.php');

$RegUserFullName = $_POST['RegUserFullName'];
$RegUserName = $_POST['RegUserName'];
$RegUserEmail = $_POST['RegUserEmail'];
$RegUserMobile = $_POST['RegUserMobile'];
$RegUserPassword = $_POST['RegUserPassword'];
$RegUserRePassword = $_POST['RegUserRePassword'];
$RegUserType = "0";
$RegUserAz = "NULL";
$RegUserPhoto = "NULL";
$RegResetCode = getRandomString($n);


if ($RegUserPassword == $RegUserRePassword)
{

if (mysqli_connect_error()){
  die('Connect Error ('. mysqli_connect_errno() .') '
    . mysqli_connect_error());
}
else{
  $SELECT = "SELECT UserEmail From users Where UserEmail = ? Limit 1";
  
  $INSERT= "INSERT INTO users(UserAz, UserName, UserPassword, UserEmail, UserMobile, UserFullName, Type, UserPhoto, ResetCode) VALUES (?,?,?,?,?,?,?,?,?)";
//Előkészítés és email cím vizsgálata
     $stmt = $conn->prepare($SELECT);
     $stmt->bind_param("s", $RegUserEmail);
     $stmt->execute();
     $stmt->bind_result($RegUserEmail);
     $stmt->store_result();
     $rnum = $stmt->num_rows;

      if ($rnum==0) {
      $stmt->close();
      $stmt = $conn->prepare($INSERT);
      $stmt->bind_param("sssssssss",$RegUserAz,$RegUserName,$RegUserPassword,$RegUserEmail,$RegUserMobile,$RegUserFullName, $RegUserType, $RegUserPhoto, $RegResetCode);
      $stmt->execute();
      echo "Új felhasználó sikeresen regisztrálva";
     } else {
      echo "Az email címmel már regisztráltak!";
     }
     $stmt->close();
     $conn->close();
    }
} else {
  echo
  "<div class='form'>
  <h3>A megadott jelszavak nem egyeznek!</h3>
  <br/>Kattints ide az oldal  <a href='../src/home.html'>újratöltéséért!</a></div>";
 die();

}
?>
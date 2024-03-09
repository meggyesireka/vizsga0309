<?php

session_start();

include('connect.php');

$LogEmail=$_POST['LogEmailInput'];

$LogPassword=$_POST['LogPassInput'];

$qry="SELECT * From users Where UserEmail='$LogEmail' && UserPassword='$LogPassword' ";

$c=mysqli_query($conn, $qry);

$result=mysqli_query($conn,$qry);

$num = mysqli_num_rows($result);

if($num == 1)
{
 
$_SESSION['UserEmail'] = $LogEmail;
header("Location: ../src/user.html");

}
else
{
echo
"<div class='form'>
<h3>A felhasználó név vagy a jelszó hibás!</h3>
<br/>Kattints ide az oldal  <a href='../src/home.html'>újratöltéséért!</a></div>";
}


?>
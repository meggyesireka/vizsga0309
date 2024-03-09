
<?php
    session_start();
    include 'includes/connect.php';
    $conn = $pdo->open();
    $LogEmail = $_POST['LogEmailInput'];
    $LogPassword = $_POST['LogPassInput'];
    $qry="SELECT * From users Where UserEmail='$LogEmail' && UserPassword='$LogPassword' ";

$c=mysqli_query($con, $qry);

$result=mysqli_query($con,$qry);

$num = mysqli_num_rows($result);

if($num == 1)
{
 
$_SESSION['UserEmail'] = $LogEmail;
echo "<script>alert('Sikeres!')</script>";
  
}
else
{
echo "<script>alert('Helytelen email cím vagy jelszó!')</script>"; 
}
?>
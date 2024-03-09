
<?php
    session_start();
    include ('connect.php');
    $conn = $pdo->open();
    $LogEmail = $_POST['LogEmailInput'];
    $LogPassword = $_POST['LogPassInput'];
    $qry="SELECT * From users Where UserEmail='$LogEmail' && UserPassword='$LogPassword' ";

$c=mysqli_query($conn, $qry);

$result=mysqli_query($conn,$qry);

$num = mysqli_num_rows($result);

if($num == 1)
{
 
$_SESSION['UserEmail'] = $LogEmail;
  
}
else
{
echo "<script>alert('Helytelen email cím vagy jelszó!')</script>"; 
}
?>
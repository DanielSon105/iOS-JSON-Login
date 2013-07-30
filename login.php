<?php  
$user = "USERNAME";
$pass = "PASSWORD";
$database = "DATABASE";
$salt = "SALT";

$mysqli = new mysqli('localhost', $user, $pass, $database);

$username = $_GET['username'];  
$username = addcslashes($username, "';");

$password = $_GET['password'];  
$password = addcslashes($password, "';");
 
$query = $mysqli->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
$query->bind_param('ss', $username, $password);
$query->execute();

$query->bind_result($sql_ID, $sql_Username, $sql_password);

if ($query->fetch())  
{  
	$response = array(  
		'logged' => true,  
		'id' => $sql_ID,  
		'username' => $sql_Username,
		'password' => $sql_password
	);  
	echo json_encode($response);  
}  
else  
{  
	$response = array(  
		'logged' => false,  
		'message' => 'Invalid Username and/or Password'  
	);  
	echo json_encode($response);  
}  

mysqli_close($link);
?>  
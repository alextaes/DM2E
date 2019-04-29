
<?php

function ConectarDB(){
    $dbhost = "localhost";
    $dbuser = "dm2e";
    $dbpass = "dm2e";
    $db     = "12251-dm2e";//

    $conn = new mysqli($dbhost, $dbuser, $dbpass,$db) or die("Conexión no establecida: %s\n". $conn -> error);
    mysqli_set_charset($conn, 'utf8');
    return $conn;
 }
 
function DesconectarDB($conn){
    $conn -> close();
}
   
?>





















































<?php

    if (isset($_REQUEST['nombre'])){	
        if (isset($_REQUEST['nombre'])){$nombre=$_REQUEST['nombre'];}
        if (isset($_REQUEST['mail'])){$mail=$_REQUEST['mail'];}
        if (isset($_REQUEST['tel'])){$tel=$_REQUEST['tel'];}
        if (isset($_REQUEST['mensaje'])){$mensaje=$_REQUEST['mensaje'];}
    }


    if($nombre!="" && $mail!="" && $tel != "" && $mensaje!="") {

        // conectar al servidor
        $conn=mysqli_connect('localhost', 'dm2e', 'dm2e');
        if (!$conn) {
            die('No pudo conectarse: ' . mysqli_error());
        }

        // seleccionar base de datos
        $base='12251-dm2e';
        if (!mysqli_select_db($conn,$base)) {
            echo 'No pudo seleccionar la base de datos';
            exit;
        }

        
        $sql = "INSERT INTO usuarios (nombre, mail, tel, mensaje) VALUES ('$nombre', '$mail', '$tel', '$mensaje')";
        if (mysqli_query($conn, $sql)) {
            echo "Nuevo registro creado!";
        } else {
            echo "Error: " . $sql . "-" . mysqli_error($conn);
        }
        mysqli_close($conn);


    } else {
        echo "Faltan datos";
    }
      
?>
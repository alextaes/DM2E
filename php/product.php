<?php
    include_once 'bd.php';
    $conn = ConectarDB();
    $array = array();

    

    if ($conn->connect_error) {
        die("Conexión no establecida: " . $conn->connect_error);
    }


if(isset($_GET["nivel"])) {

    
    if($_GET["nivel"]=="1"){
        $categoria = $_GET["categoria"];

        if($categoria=="Cámaras" || $categoria == "Consolas") {

            $sql = "SELECT p.nombre 'nombre',p.marca 'marca', p.foto 'img', c.nombre 'categoria', t.nombre 'tienda',t.latitud 'la',t.longitud 'lo',pr.precio 'precio' 
                     FROM productos p, tiendas t, precios pr, categorias c, productocat pc 
                     WHERE p.id=pr.id_producto AND pr.id_tienda=t.id AND c.id=pc.categoria AND p.id=pc.producto AND c.nombre LIKE '%$categoria%'";

            $query=mysqli_query($conn, $sql);

            while($row=mysqli_fetch_assoc($query)){
            $array[] = array("nombre"=>$row['nombre'], "marca"=>$row['marca'], "img"=>$row['img'], "categoria"=>$row['categoria'],"tienda"=>$row['tienda'], "la"=>$row['la'], "lo"=>$row['lo'],"precio"=>$row['precio']);
            }
            echo json_encode($array);

        } else {

            $sql = "SELECT p.nombre 'nombre',p.marca 'marca',p.foto 'img', c.nombre 'categoria', t.nombre 'tienda',t.latitud 'la',t.longitud 'lo',pr.precio 'precio' 
                        FROM productos p, tiendas t, precios pr, categorias c, productocat pc
                        WHERE p.id=pr.id_producto AND pr.id_tienda=t.id AND c.id=pc.categoria AND p.id=pc.producto AND c.id 
                        IN (SELECT caS.id FROM categorias caS, categorias caU WHERE caS.padre=caU.id AND caU.nombre LIKE '$categoria')";

            $query=mysqli_query($conn, $sql);

            while($row=mysqli_fetch_assoc($query)){
                $array[] = array("nombre"=>$row['nombre'], "marca"=>$row['marca'], "img"=>$row['img'], "categoria"=>$row['categoria'],"tienda"=>$row['tienda'], "la"=>$row['la'], "lo"=>$row['lo'],"precio"=>$row['precio']);
                }
                echo json_encode($array);

        }

        
       
    }

    if($_GET["nivel"]=="2"){
      
        $categoria = $_GET["categoria"];
        
        $sql = "SELECT p.nombre 'nombre', p.marca 'marca', p.foto 'img', c.nombre 'categoria', t.nombre 'tienda',t.latitud 'la',t.longitud 'lo',pr.precio 'precio' 
        FROM productos p, tiendas t, precios pr, categorias c, productocat pc
        WHERE p.id=pr.id_producto AND pr.id_tienda=t.id AND c.id=pc.categoria AND p.id=pc.producto AND c.nombre LIKE '%$categoria%'";

        $query=mysqli_query($conn, $sql);

        while($row=mysqli_fetch_assoc($query)){
            $array[] = array("nombre"=>$row['nombre'], "marca"=>$row['marca'], "img"=>$row['img'], "categoria"=>$row['categoria'],"tienda"=>$row['tienda'], "la"=>$row['la'], "lo"=>$row['lo'],"precio"=>$row['precio']);
            }
            echo json_encode($array);
    }

    if($_GET["nivel"]=="3"){
    
        $categoria = $_GET["categoria"];
        $categoria = strtolower($categoria);
           
        if ($categoria == "ordenadores" or $categoria == "monitores" or $categoria == "smartphones") {
            
            $sql = "SELECT p.nombre 'nombre',p.marca 'marca',p.foto 'img', c.nombre 'categoria', t.nombre 'tienda',t.latitud 'la',t.longitud 'lo',pr.precio 'precio' 
                        FROM productos p, tiendas t, precios pr, categorias c, productocat pc
                        WHERE p.id=pr.id_producto AND pr.id_tienda=t.id AND c.id=pc.categoria AND p.id=pc.producto AND c.id 
                        IN (SELECT caS.id FROM categorias caS, categorias caU WHERE caS.padre=caU.id AND caU.nombre LIKE '$categoria')";
       
        } else {
            $sql = "SELECT DISTINCT p.nombre 'nombre', p.marca 'marca', p.foto 'img', c.nombre 'categoria', t.nombre 'tienda',t.latitud 'la',t.longitud 'lo',pr.precio 'precio' 
                        FROM productos p, tiendas t, precios pr, categorias c, productocat pc
                        WHERE p.id=pr.id_producto AND pr.id_tienda=t.id AND c.id=pc.categoria AND p.id=pc.producto AND p.nombre LIKE '%$categoria%'
                    UNION    
                    SELECT DISTINCT p.nombre 'nombre', p.marca 'marca', p.foto 'img', c.nombre 'categoria', t.nombre 'tienda',t.latitud 'la',t.longitud 'lo',pr.precio 'precio' 
                        FROM productos p, tiendas t, precios pr, categorias c, productocat pc
                        WHERE p.id=pr.id_producto AND pr.id_tienda=t.id AND c.id=pc.categoria AND p.id=pc.producto AND c.nombre LIKE '%$categoria%'
                    UNION
                    SELECT DISTINCT p.nombre 'nombre', p.marca 'marca', p.foto 'img', c.nombre 'categoria', t.nombre 'tienda',t.latitud 'la',t.longitud 'lo',pr.precio 'precio' 
                        FROM productos p, tiendas t, precios pr, categorias c, productocat pc
                        WHERE p.id=pr.id_producto AND pr.id_tienda=t.id AND c.id=pc.categoria AND p.id=pc.producto AND t.nombre LIKE '%$categoria%'";
        }
        $query = mysqli_query($conn, $sql);
    
        while ($row = mysqli_fetch_assoc($query)) {
            $array[] = array("nombre" => $row['nombre'], "marca"=>$row['marca'], "img" => $row['img'], "categoria" => $row['categoria'], "tienda" => $row['tienda'], "la" => $row['la'], "lo" => $row['lo'], "precio" => $row['precio']);
        }
        echo json_encode($array);
    
    }
    
}



    DesconectarDB($conn);
?>
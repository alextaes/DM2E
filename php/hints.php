
<?php
            
    include_once 'bd.php';
    $conn = ConectarDB();
    
        
    $productos = array();
    $categorias = array();
    $tiendas = array();
        
     
    $sql1 = 'SELECT nombre FROM productos';
    $sql2 = 'SELECT nombre FROM categorias';
    $sql3 = 'SELECT nombre FROM tiendas';
        
    $query=mysqli_query($conn, $sql1);
        
    while($row=mysqli_fetch_assoc($query)){
        $productos[] = $row['nombre'];
    }

    $query=mysqli_query($conn, $sql2);
        
    while($row=mysqli_fetch_assoc($query)){
        $categorias[] = $row['nombre'];
    }

    $query=mysqli_query($conn, $sql3);
        
    while($row=mysqli_fetch_assoc($query)){
         $tiendas[] = $row['nombre'];
    }

	
	$q = $_REQUEST["q"];
    $hint = "";

				
	if ($q !== "") {
		$q = strtolower($q);
		$len=strlen($q);
                    
        foreach($categorias as $name) {
			if (stristr($q, substr($name, 0, $len))) {
					if ($hint === "") {
						$hint = "<b>CATEGORIAS:</b> " . $name;
					} else {
						$hint .= ", $name";
					}
			}
		}
        
        foreach($productos as $name) {
			if (stristr($q, substr($name, 0, $len))) {
					$needle = "PRODUCTOS:";
					$pos = strpos($hint,$needle);
					if($pos === false) {
						$hint .= " <b>PRODUCTOS:</b> " . $name;
					} else {
						$hint .= ", $name";
					}
			}
		}
                    
        foreach($tiendas as $name) {
			if (stristr($q, substr($name, 0, $len))) {
				    $needle = "TIENDAS:";
					$pos = strpos($hint,$needle);
					if($pos === false) {
						$hint .= " <b>TIENDAS:</b> " . $name;
					} else {
						$hint .= ", $name";
					}
			}
		}
	}

	echo $hint === "" ? "No hay sugerencias" : $hint;
                
?>
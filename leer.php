<?php
include ("header.php");
if (isset($_REQUEST['id'])){
$id = $_REQUEST['id'];
if(array_key_exists('id', $_REQUEST)){
    $obj_noticia = new blognote();
    $actividades =$obj_noticia->ver_nota($_REQUEST['id']);
}

    foreach($actividades as $actividad) {
        print("<td><h2>" . $actividad['titulo'] . "</h2></td>");
        print("<td><p>" . $actividad['texto'] . "</td><br>");
        $datetime = new DateTime($actividad['fecha']);
        print("<td>" . $datetime->format("H:i:s M/d/Y") . "</td>\n");
    }
}else {
    print"No hay regitro";
}
 if(isset($_REQUEST['eliminar'])) {
    $eliminar = $_GET['eliminar'];
        print_r($eliminar);
        $obj_noticia = new blognote();
        $obj_noticia->eliminar_nota($eliminar);
        print"Se elimino el registro";
    } 
?> 
<a href="leer.php?eliminar=<?php echo $id ?>">Eliminar</a>
<a href="editar.php?id=<?php echo $id ?>">editar</a>
<?php
include ("footer.php");
?>
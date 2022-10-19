<?php
include ("header.php");
if (isset($_REQUEST['id'])){
$id = $_REQUEST['id'];
if(array_key_exists('id', $_REQUEST)){
    $obj_noticia = new blognote();
    $actividades =$obj_noticia->ver_nota($_REQUEST['id']);
}

    foreach($actividades as $actividad) {
        print("<td><h1>" . $actividad['titulo'] . "</h1></td>");
        print("<td><p><h2>" . $actividad['tipo_actividad'] . "</h2></td>");
        print("<td><p>" . $actividad['texto'] . "</td><br><br>");
        print("<td>Ubicacion" . $actividad['ubicacion'] . "</td><br>");
        $datetimerange = new DateTime($actividad['rango']);
        print("<td> Actividad para el &nbsp" . $datetimerange->format("Y/M/d") . "</td><br>");
        $datetime = new DateTime($actividad['fecha']);
        print("<td> Creada el &nbsp" . $datetime->format("Y/M/d") . "</td><br>");
    }
    ?>
    <br><br>
    <a href="eliminar.php?id=<?php echo $id ?>"><input type="button" value="ELIMINAR"></a>
    <a href="editar.php?id=<?php echo $id ?>"><input type="button" value="EDITAR"></a>
    <?php
}else {
    print"No hay regitro";
}

?> 
<?php
include ("footer.php");
?>
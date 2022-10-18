<?php
include ("header.php");
?>
<?php
if (isset($_REQUEST['id'])){
    $id = $_REQUEST['id'];
    if(array_key_exists('id', $_REQUEST)){
        $obj_noticia = new blognote();
        $actividades =$obj_noticia->ver_nota($_REQUEST['id']);
    }
    
        foreach($actividades as $actividad) {
            ?>
            <form action="editar.php" method="post">
            <input type="text" name="titulo" value="<?php echo("" . $actividad['titulo'] . ""); ?>">
            <input type="text" name="texto" value="<?php echo("" . $actividad['texto'] . ""); ?>">
            <input type="text" name="ubicacion" value="<?php echo("" . $actividad['ubicacion'] . ""); ?>">
            <input type="time" name="texto" value="<?php echo("" . $actividad['rango'] . ""); ?>">
            <input type="submit" name="edita" value="Editar">
            </form>
        <?php
        }
    }else {
        print"No hay regitro";
    }
?>

<?php
include ("footer.php");
if(array_key_exists('editar', $_POST)){
    $obj_noticia = new blognote();
    $noticias_new = $obj_noticia->editar_nota($_REQUEST[$id], $_REQUEST['titulo'], $_REQUEST['texto'], $_REQUEST['ubicacion'], $_REQUEST['rango']);
}
?>
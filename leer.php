<?php
include ("header.php");
$id=$_REQUEST['id'];
if(array_key_exists('id', $_REQUEST)){
    $obj_noticia = new blognote();
    $actividades =$obj_noticia->ver_nota($_REQUEST['id']);
    
}


    foreach($actividades as $actividad) {
        print("<td><h2>" . $actividad['titulo'] . "</h2></td>");
        print("<td><p>" . $actividad['texto'] . "</td><br>");
        print("<td>" . date("j/n/Y",strtotime($actividad['fecha'])) . "</td>");
    }
?>

<?php
include ("footer.php");
?>
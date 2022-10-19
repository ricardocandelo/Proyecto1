<?php
require_once("logica/Agenda.php");
if(isset($_REQUEST['id'])) {
    $id=$_REQUEST['id'];
    $obj_eliminar_nota = new blognote();
    $obj_eliminar_nota->eliminar_nota($_REQUEST['id']);
    } 
else{
    echo '<script>alert("Se agrego correcatmenet")</script>';
    ?>
    <a href="index.php"><input type="button" value="VOLVER"></a>
    <?php
}
?>
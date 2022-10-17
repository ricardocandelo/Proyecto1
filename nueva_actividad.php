<?php
    include ("header.php");
?>
<h1>Nueva actividad</h1>

<form name="AgregarNuevaActividad" method="post" action="nueva_actividad.php">
    <br>
    <label for="cars">Tipo de actividad:</label>
    <select name="actividad" id="actividad">
    <option value="Trabajo">Trabajo</option>
    <option value="Estudios">Estudios</option>
    <option value="pHogar">Pendientes del Hogar</option>
    </select><br><br><br>
    Titulo: <input type="text" name="titulo"><br><br><br>
    Texto: <input type="text" name="texto"><br><br><br>
    Fecha: <input type="date" name="fecha"><br><br><br>
    <input type="submit" name="Agregar" value="Agregar">
</form>
<br><br>

<?php
    require_once("logica/Agenda.php");
    if(array_key_exists('Agregar', $_POST)) {
        $obj_agenda = new blognote();
        $obj_agenda->nueva_nota($_REQUEST['titulo'], $_REQUEST['texto']);
    print("<p>Se ha agregado la nueva actividad.</p>\n\n");
}

?>
<a href="index.php">Volver</a><br><br>

<?php
    include ("footer.php");
?>
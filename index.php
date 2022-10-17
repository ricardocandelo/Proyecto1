<?php
include ("header.php");
 $obj_agenda = new blognote();
    $actividades = $obj_agenda->listar_notas();

    $nfilas = count($actividades);

    if($nfilas > 0) {
        print("<table>\n");
        print("<tr>\n");
        print("<th>Titulo</th>\n");
        print("<th>Texto</th>\n");
        print("<th>Fecha</th>\n");
        print("</tr>\n");

        foreach($actividades as $actividad) {
            print("<tr>\n");
            print("<tr>\n<td>")?><a href="leer.php?id=<?php echo $actividad['id']?>"><?php echo $actividad['titulo']?></a> 
            <?php
            print("</td>\n");
            echo("<td>" . $actividad['texto'] . "</td>\n");
            print("<td>" . date("j/n/Y",strtotime($actividad['fecha'])) . "</td>\n");
            print("</tr>\n");
        }
        print("</table>\n");

    } else {
        print("No tiene actividades registradas.");
    }

    ?>

<?php
include ("footer.php");
?>
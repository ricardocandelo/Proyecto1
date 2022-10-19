<?php
include ("header.php");
 $obj_agenda = new blognote();
    $actividades = $obj_agenda->listar_notas();

    $nfilas = count($actividades);

    if($nfilas > 0) {
        print("<table>\n");
        print("<tr>\n");
        print("<th>&nbsp Titulo</th>\n");
        print("<th>&nbsp Actividad</th>\n");
        print("<th>&nbsp Texto</th>\n");
        print("<th>&nbsp Programado para el &nbsp</th>\n");
        print("</tr>\n");

        foreach($actividades as $actividad) {
            print("<tr>\n");
            print("<tr>\n<td> &nbsp")?><a href="leer.php?id=<?php echo $actividad['id']?>"><?php echo $actividad['titulo']?></a> 
            <?php
            print("&nbsp</td>\n");
            print("<td> &nbsp" . $actividad['tipo_actividad'] . "&nbsp</td>\n");
            print("<td> &nbsp" . $actividad['texto'] . "&nbsp</td>\n");
            $datetimerange = new DateTime($actividad['rango']);
            print("<td>&nbsp" . $datetimerange->format("d/M/Y") . "&nbsp</td>\n");
            print("</tr>\n");
        }
        print("</table>\n");

    } else {
        print("No tiene actividades registradas.");
    }

    ?>

<?php
include ("footer_index.php");
?>
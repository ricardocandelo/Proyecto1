<?php
    require_once('conexion.php');
    class blognote extends modeloCredencialesDB{

        public function __autoload() {
            parent::__construct();
        }

        public function listar_notas(){
            $instruccion = "CALL sp_listar_notas";

            $consulta=$this->_db->query($instruccion);
            $resultado=$consulta->fetch_all(MYSQLI_ASSOC);
            
            if ($resultado){
                return $resultado;
                $resultado->close();
                $this->_db->close();
            }

        }
        
        public function ver_nota($note){
            $instruccion = "CALL sp_leer('".$note."')";
            $consulta=$this->_db->query($instruccion);
            $resultado=$consulta->fetch_all(MYSQLI_ASSOC);
            if($resultado){
                return $resultado;
                $resultado->close();
                $this->_db->close();
            }
        }

        public function nueva_nota($titulo, $texto, $ubicacion, $rango, $actividad){
            $instruccion = "CALL sp_nueva_nota(?, ?, ?, ?, ?)";
            $stmt = $this->_db->prepare($instruccion);
            $stmt->bind_param("sssss", $titulo, $texto, $ubicacion, $rango, $actividad);
            $stmt->execute();
            if ($stmt){
                echo '<script>alert("Se agrego correcatmenet")</script>';
                ?>
                <a href="index.php"><input type="button" value="VOLVER"></a>
                <?php
            }
        }
        

        public function eliminar_nota($id){
                
                $instruccion = "CALL sp_eliminar($id)";
                $stmt = $this->_db->prepare($instruccion);
                $stmt->execute();
                echo '<script>alert("Se elimino correctamente")</script>';
                ?>
                <a href="index.php"><input type="button" value="VOLVER"></a>
                <?php
                
        }

        public function editar_nota($id, $titulo, $texto, $ubicacion, $rango){
            $instruccion = "CALL sp_editar(?, ?, ?, ?, ?)";
            $stmt = $this->_db->prepare($instruccion);
            $stmt->bind_param("issss",$id, $titulo, $texto, $ubicacion, $rango);
            $stmt->execute();
            if ($stmt){
                header("Location: leer.php?id=$id");
            }
        }  
    }

?>
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

        public function nueva_nota($titulo, $texto){
            $instruccion = "CALL sp_nueva_nota('".$titulo."','".$texto."')";
            $this->_db->close();
        }
        

        public function eliminar_nota($id){
        
                $instruccion = "CALL sp_eliminar($id)";
                $this->_db->close();
        }

        public function editar_nota($id, $titulo, $texto, $ubicacion, $rango){
            $instruccion = "CALL sp_editar('".$id."''".$titulo."''".$texto."''".$ubicacion."''".$rango."')";
            $this->_db->close();
        }  
    }

?>
<?php
    require_once('conexion.php');
    class agenda extends modeloCredencialesDB{
        protected $id;
        protected $titulo;
        protected $texto;
        protected $actividad;
        protected $fecha;
        protected $rango;
        protected $rango_final;

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

        public function nueva_nota($titulo, $texto, $ubicacion, $rango, $actividad, $rango_final){
            $instruccion = "CALL sp_nueva_nota(?, ?, ?, ?, ?, ?)";
            $stmt = $this->_db->prepare($instruccion);
            $stmt->bind_param("ssssss", $titulo, $texto, $ubicacion, $rango, $actividad, $rango_final);
            $stmt->execute();
        }
        

        public function eliminar_nota($id){
                $instruccion = "CALL sp_eliminar($id)";
                $stmt = $this->_db->prepare($instruccion);
                $stmt->execute();
                
        }

        public function editar_nota($id, $titulo, $texto, $ubicacion, $rango, $actividad, $rango_final){
            $instruccion = "CALL sp_editar(?, ?, ?, ?, ?, ?, ?)";
            $stmt = $this->_db->prepare($instruccion);
            $stmt->bind_param("issssss",$id, $titulo, $texto, $ubicacion, $rango, $actividad, $rango_final);
            $stmt->execute();
            if ($stmt){
                header("Location: leer.php?id=$id");
            }
        }  

        public function filtrar_actividad($campo, $valor){ 
            $instruccion = "CALL sp_filtrar_actividad('".$campo."','".$valor."')";
            $consulta=$this->_db->query($instruccion);
            $resultado=$consulta->fetch_all(MYSQLI_ASSOC);
            if($resultado){
                return $resultado;
                $resultado->close();
                $this->_db->close();
            }
        }   
    }

?>
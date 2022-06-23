<?php
    class Clothes{
        // Connection
        private $conn;
        // Table
        private $db_table = "clothes";
        // Columns
        public $clothes_name;
        public $clothes_type;
        public $clothes_situation;
        public $clothes_style;
        public $clothes_best_weather;
        public $clothes_best_temp;
        public $clothes_gender ;
        public $clothes_detailtype;
        // Db connection
        public function __construct($db){
            $this->conn = $db;
        }
        // GET ALL
        public function getClothes(){
            $sqlQuery = "SELECT clothes_name, clothes_type, clothes_situation, clothes_style, clothes_best_weather, clothes_best_temp,clothes_gender,clothes_detailtype FROM " . $this->db_table . "";
            $stmt = $this->conn->prepare($sqlQuery);
            $stmt->execute();
            return $stmt;
        }    
        // GET TOP
        public function getTopClothes(){
            $sqlQuery = "SELECT clothes_name, clothes_type, clothes_situation, clothes_style, clothes_best_weather, clothes_best_temp,clothes_gender,clothes_detailtype FROM " . $this->db_table . " where clothes_type = '상의' and clothes_style = ? and clothes_gender = ?";
            $stmt = $this->conn->prepare($sqlQuery);
            $stmt->bindParam(1,$this->clothes_style);
	    $stmt->bindParam(2,$this->clothes_gender);
	    
		$stmt->execute();
            return $stmt;
        }
	        // GET bottom
        public function getBottomClothes(){
            $sqlQuery = "SELECT clothes_name, clothes_type, clothes_situation, clothes_style, clothes_best_weather, clothes_best_temp,clothes_gender,clothes_detailtype FROM " . $this->db_table . " where clothes_type = '하의' and clothes_style = ? and clothes_gender = ?";

            $stmt = $this->conn->prepare($sqlQuery);
            $stmt->bindParam(1, $this->clothes_style);
	    $stmt->bindParam(2, $this->clothes_gender);
            $stmt->execute();
            return $stmt;
        }   

                // GET outer
        public function getOuterClothes(){
            $sqlQuery = "SELECT clothes_name, clothes_type, clothes_situation, clothes_style, clothes_best_weather, clothes_best_temp,clothes_gender,clothes_detailtype FROM " . $this->db_table . " where clothes_type = '아우터' and clothes_style = ? and clothes_gender = ?";

            $stmt = $this->conn->prepare($sqlQuery);
            $stmt->bindParam(1, $this->clothes_style);
            $stmt->bindParam(2, $this->clothes_gender);
	    $stmt->execute();
            return $stmt;
        }   
                        // GET acce
        public function getAcceClothes(){
            $sqlQuery = "SELECT clothes_name, clothes_type, clothes_situation, clothes_style, clothes_best_weather, clothes_best_temp,clothes_gender,clothes_detailtype FROM " . $this->db_table . " where clothes_type = '악세' and clothes_style = ? and clothes_gender = ?";

            $stmt = $this->conn->prepare($sqlQuery);
            $stmt->bindParam(1, $this->clothes_style);
            $stmt->bindParam(2, $this->clothes_gender);
 	    $stmt->execute();
            return $stmt;
        }  
        public function getShoeClothes(){
            $sqlQuery = "SELECT clothes_name, clothes_type, clothes_situation, clothes_style, clothes_best_weather, clothes_best_temp,clothes_gender,clothes_detailtype FROM " . $this->db_table . " where clothes_type = '신발' and clothes_style = ? and clothes_gender = ?";


            $stmt = $this->conn->prepare($sqlQuery);
            $stmt->bindParam(1, $this->clothes_style);
            $stmt->bindParam(2, $this->clothes_gender);
            $stmt->execute();
            return $stmt;
        }


    }
?>

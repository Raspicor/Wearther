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
        public $clothes_color;
        public $clothes_gender ;
        public $clothes_detailtype;
        // Db connection
        public function __construct($db){
            $this->conn = $db;
        }
        // GET ALL
        public function getClothes(){
            $sqlQuery = "SELECT clothes_name, clothes_type, clothes_situation, clothes_style, clothes_best_weather, clothes_best_temp,clothes_color,clothes_gender,clothes_detailtype FROM " . $this->db_table . "";
            $stmt = $this->conn->prepare($sqlQuery);
            $stmt->execute();
            return $stmt;
        }    

    }
?>

<?php
    class Location{
        // Connection
        private $conn;
        // Table
        private $db_table = "location";
        // Columns
        public $latitude;
        public $longitude;
        public $location_name;
        // Db connection
        public function __construct($db){
            $this->conn = $db;
        }
        // CREATE
        public function createLocation(){
            $sqlQuery = "INSERT INTO
                        ". $this->db_table ."
                    SET
                        latitude = :latitude, 
                        longitude = :longitude, 
                        location_name = :location_name ON DUPLICATE KEY UPDATE
latitude = :latitude, longitude = :longitude, location_name = :location_name		
";
        
            $stmt = $this->conn->prepare($sqlQuery);
        
            // sanitize
            $this->latitude=htmlspecialchars(strip_tags($this->latitude));
            $this->longitude=htmlspecialchars(strip_tags($this->longitude));
            $this->location_name=htmlspecialchars(strip_tags($this->location_name));

        
            // bind data
            $stmt->bindParam(":latitude", $this->latitude);
            $stmt->bindParam(":longitude", $this->longitude);
            $stmt->bindParam(":location_name", $this->location_name);
        
            if($stmt->execute()){
               return true;
            }
            return false;
        }
        // READ single
        public function getSingleLotation(){
            $sqlQuery = "SELECT
                        latitude, 
                        longitude, 
                        location_name
                      FROM
                        ". $this->db_table ."
                    WHERE 
                       location_name = ?
                    LIMIT 0,1";
            $stmt = $this->conn->prepare($sqlQuery);
            $stmt->bindParam(1, $this->location_name);
            $stmt->execute();
            $dataRow = $stmt->fetch(PDO::FETCH_ASSOC);
            
            $this->latitude = $dataRow['latitude'];
            $this->longitude = $dataRow['longitude'];
            $this->location_name = $dataRow['location_name'];
        }        

    }
?>

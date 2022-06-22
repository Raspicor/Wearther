<?php 
    class Database {
        private $host = 'mysql';
        private $database_name = 'myDB';
        private $username = 'kim';
        private $password = 'json';
        private $port = "3306";

        public $conn;
        public function getConnection(){
            $this->conn = null;
            try{
                $this->conn =  new PDO('mysql:host='.$this->host.'; port=3306; dbname='.$this->database_name,$this->username,$this->password);
                $this->conn->exec("set names utf8");
            }catch(PDOException $exception){
                echo "Database could not be connected: " . $exception->getMessage();
            }
            
            return $this->conn;
        }
    }  
?>



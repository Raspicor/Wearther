<?php
    class Post{
        // Connection
        private $conn;
        // Table
        private $db_table = "post";
        // Columns
        public $post_id;
        public $member_id;
        public $post_date;
        public $content;
        public $location_name;
        // Db connection
        public function __construct($db){
            $this->conn = $db;
        }
        // GET ALL
        public function getPosts(){
            $sqlQuery = "SELECT post_id, member_id, post_date, content, location_name FROM " . $this->db_table . "";
            $stmt = $this->conn->prepare($sqlQuery);
            $stmt->execute();
            return $stmt;
        }
        // CREATE
        public function createPost(){
            $sqlQuery = "INSERT INTO
                        ". $this->db_table ."
                    SET
                        post_id = :post_id, 
                        member_id = :member_id, 
                        post_date = :post_date, 
                        content = :content,
                        location_name = :location_name";
        
            $stmt = $this->conn->prepare($sqlQuery);
        
            // sanitize
            $this->post_id=htmlspecialchars(strip_tags($this->post_id));
            $this->member_id=htmlspecialchars(strip_tags($this->member_id));
            $this->post_date=htmlspecialchars(strip_tags($this->post_date));
            $this->content=htmlspecialchars(strip_tags($this->content));
            $this->location_name=htmlspecialchars(strip_tags($this->location_name));
        
            // bind data
            $stmt->bindParam(":post_id", $this->post_id);
            $stmt->bindParam(":member_id", $this->member_id);
            $stmt->bindParam(":post_date", $this->post_date);
            $stmt->bindParam(":content", $this->content);
            $stmt->bindParam(":location_name", $this->location_name);
        
            if($stmt->execute()){
               return true;
            }
            return false;
        }
        // READ single
        public function getSinglePost(){
            $sqlQuery = "SELECT
                        post_id, 
                        member_id, 
                        post_date, 
                        content, 
                        location_name
                      FROM
                        ". $this->db_table ."
                    WHERE 
                       post_id = ?
                    LIMIT 0,1";
            $stmt = $this->conn->prepare($sqlQuery);
            $stmt->bindParam(1, $this->post_id);
            $stmt->execute();
            $dataRow = $stmt->fetch(PDO::FETCH_ASSOC);
            
            $this->post_id = $dataRow['post_id'];
            $this->member_id = $dataRow['member_id'];
            $this->post_date = $dataRow['post_date'];
            $this->content = $dataRow['content'];
            $this->location_name = $dataRow['location_name'];
        }        
        // UPDATE
        public function updatePost(){
            $sqlQuery = "UPDATE
                        ". $this->db_table ."
                    SET
                        post_id = :post_id, 
                        member_id = :member_id, 
                        post_date = :post_date, 
                        content = :content,
                        location_name = :location_name,
                    WHERE 
                        post_id = :post_id";
        
            $stmt = $this->conn->prepare($sqlQuery);
        
            $this->post_id=htmlspecialchars(strip_tags($this->post_id));
            $this->member_id=htmlspecialchars(strip_tags($this->member_id));
            $this->post_date=htmlspecialchars(strip_tags($this->post_date));
            $this->content=htmlspecialchars(strip_tags($this->content));
            $this->location_name=htmlspecialchars(strip_tags($this->location_name));
        
            // bind data
            $stmt->bindParam(":post_id", $this->post_id);
            $stmt->bindParam(":member_id", $this->member_id);
            $stmt->bindParam(":post_date", $this->post_date);
            $stmt->bindParam(":content", $this->content);
            $stmt->bindParam(":location_name", $this->location_name);
        
            if($stmt->execute()){
               return true;
            }
            return false;
        }
        // DELETE
        function deleteEmployee(){
            $sqlQuery = "DELETE FROM " . $this->db_table . " WHERE post_id = ?";
            $stmt = $this->conn->prepare($sqlQuery);
        
            $this->post_id=htmlspecialchars(strip_tags($this->post_id));
        
            $stmt->bindParam(1, $this->post_id);
        
            if($stmt->execute()){
                return true;
            }
            return false;
        }
    }
?>

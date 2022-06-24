<?php
    class Member{
        // Connection
        private $conn;
        // Table
        private $db_table = "member";
        // Columns
        public $member_id;
        public $member_gender;
        public $member_favorite_style;
        public $member_nickname;
        public $member_password;
        public $location_name;
        // Db connection
        public function __construct($db){
            $this->conn = $db;
        }
        // GET ALL
        public function getMembers(){
            $sqlQuery = "SELECT member_id, member_gender, member_favorite_style, member_nickname, member_password, location_name FROM " . $this->db_table . "";
            $stmt = $this->conn->prepare($sqlQuery);
            $stmt->execute();
            return $stmt;
        }
        // CREATE
        public function createMember(){
            $sqlQuery = "INSERT INTO
                        ". $this->db_table ."
                    SET
                        member_id = :member_id, 
                        member_gender = :member_gender, 
                        member_favorite_style = :member_favorite_style, 
                        member_nickname = :member_nickname,
                        location_name = :location_name, 
                        member_password = :member_password";
        
            $stmt = $this->conn->prepare($sqlQuery);
        
            // sanitize
            $this->member_id=htmlspecialchars(strip_tags($this->member_id));
            $this->member_gender=htmlspecialchars(strip_tags($this->member_gender));
            $this->member_favorite_style=htmlspecialchars(strip_tags($this->member_favorite_style));
            $this->member_nickname=htmlspecialchars(strip_tags($this->member_nickname));
            $this->member_password=htmlspecialchars(strip_tags($this->member_password));
            $this->location_name=htmlspecialchars(strip_tags($this->location_name));
        
            // bind data
            $stmt->bindParam(":member_id", $this->member_id);
            $stmt->bindParam(":member_gender", $this->member_gender);
            $stmt->bindParam(":member_favorite_style", $this->member_favorite_style);
            $stmt->bindParam(":member_nickname", $this->member_nickname);
            $stmt->bindParam(":member_password", $this->member_password);
            $stmt->bindParam(":location_name", $this->location_name);
        
            if($stmt->execute()){
               return true;
            }
            return false;
        }
        // READ single
        public function getSingleMember(){
            $sqlQuery = "SELECT
                        member_id, 
                        member_gender, 
                        member_favorite_style, 
                        member_nickname, 
                        member_password,
                        location_name
                      FROM
                        ". $this->db_table ."
                    WHERE 
                       member_id = ?
                    LIMIT 0,1";
            $stmt = $this->conn->prepare($sqlQuery);
            $stmt->bindParam(1, $this->member_id);
            $stmt->execute();
            $dataRow = $stmt->fetch(PDO::FETCH_ASSOC);
            
            $this->member_id = $dataRow['member_id'];
            $this->member_gender = $dataRow['member_gender'];
            $this->member_favorite_style = $dataRow['member_favorite_style'];
            $this->member_nickname = $dataRow['member_nickname'];
            $this->member_password = $dataRow['member_password'];
            $this->location_name = $dataRow['location_name'];
        }        
        // UPDATE
        public function updateMember(){
            $sqlQuery = "UPDATE
                        ". $this->db_table ."
                    SET
                        member_gender = :member_gender, 
                        member_favorite_style = :member_favorite_style, 
                        member_nickname = :member_nickname, 
                        member_password = :member_password,
                        location_name = :location_name,
                    WHERE 
                        member_id = :member_id";
        
            $stmt = $this->conn->prepare($sqlQuery);
        
            $this->member_gender=htmlspecialchars(strip_tags($this->member_gender));
            $this->member_favorite_style=htmlspecialchars(strip_tags($this->member_favorite_style));
            $this->member_nickname=htmlspecialchars(strip_tags($this->member_nickname));
            $this->member_password=htmlspecialchars(strip_tags($this->member_password));
            $this->member_id=htmlspecialchars(strip_tags($this->member_id));
            $this->location_name=htmlspecialchars(strip_tags($this->location_name));
        
            // bind data
            $stmt->bindParam(":member_gender", $this->member_gender);
            $stmt->bindParam(":member_favorite_style", $this->member_favorite_style);
            $stmt->bindParam(":member_nickname", $this->member_nickname);
            $stmt->bindParam(":member_password", $this->member_password);
            $stmt->bindParam(":member_id", $this->member_id);
            $stmt->bindParam(":location_name", $this->location_name);
        
            if($stmt->execute()){
               return true;
            }
            return false;
        }
        // DELETE
        function deleteEmployee(){
            $sqlQuery = "DELETE FROM " . $this->db_table . " WHERE member_id = ?";
            $stmt = $this->conn->prepare($sqlQuery);
        
            $this->member_id=htmlspecialchars(strip_tags($this->member_id));
        
            $stmt->bindParam(1, $this->member_id);
        
            if($stmt->execute()){
                return true;
            }
            return false;
        }
        // single member login
        public function getSingleMemberLogin(){
            $sqlQuery = "SELECT
                        member_id,
                        member_gender,
                        member_favorite_style,
                        member_nickname,
                        member_password,
                        location_name
                      FROM
                        ". $this->db_table ."
                    WHERE
                       member_id = ? and member_password = ?
                    LIMIT 0,1";
            $stmt = $this->conn->prepare($sqlQuery);
            $stmt->bindParam(1, $this->member_id);
	    $stmt->bindParam(2, $this->member_password);
            $stmt->execute();
            $dataRow = $stmt->fetch(PDO::FETCH_ASSOC);

            $this->member_id = $dataRow['member_id'];
            $this->member_gender = $dataRow['member_gender'];
            $this->member_favorite_style = $dataRow['member_favorite_style'];
            $this->member_nickname = $dataRow['member_nickname'];
            $this->member_password = $dataRow['member_password'];
            $this->location_name = $dataRow['location_name'];
        }

    }
?>

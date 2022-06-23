<?php
    class Condition{

        public $gender;
        public $style;
        public $weather;
        public $temp;
        public $situation;
        private $conn;
        // Db connection
        public function __construct($db){
            $this->conn = $db;
        }
	public function calculate($e){

	$score = 0;            
	    if ($this->gender == $e["clothes_gender"]){
                $score +=1;
            }
	    if ($this->style == $e["clothes_style"]){
                $score +=1;
            }
            if ($this->weather == $e["clothes_best_weather"]){
                $score +=1;
            }
            if ($this->temp == $e["clothes_best_temp"]){
                $score +=1;
            }
            if ($this->situation == $e["clothes_situation"]){
                $score +=1;
            }
		return $score;
	}       

    }
?>

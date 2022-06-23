<?php
    class Condition{
        public $gender;
        public $style;
        public $weather;
        public $temp;
        public $situation;
	public $weatherarray = array(
	                "맑음" => array("맑음" => 3,"흐림" => 2, "비" => 1),
                "흐림" => array("맑음" => 1,"흐림" => 3, "비" => 2),
                "비" => array("맑음" => 1,"흐림" => 2, "비" => 10),);
        public $situationarray = array(
                "학교" => array("학교" => 10,"일상" => 4, "데이트" => 1 , "공적" => 7),
                "일상" => array("학교" => 7,"일상" => 10, "데이트" => 4 , "공적" =>1),
                "데이트" => array("학교" => 4,"일상" => 7, "데이트" => 10 , "공적" =>1),
                "공적" => array("학교" => 4,"일상" => 1, "데이트" => 7 , "공적" =>10),
            );
	private $conn;
        // Db connection
        public function __construct($db){
            $this->conn = $db;
        }
	public function calculate($e){

	$score = 0;           
	$score = $score + 20 - (abs)((int)(($this->temp - $e["clothes_best_temp"])/3));
	$score = $score + $this->weatherarray[$this->weather][$e["clothes_best_weather"]];            
        $score = $score + $this->situationarray[$this->situation][$e["clothes_best_situation"]];

		return $score;
	}       

    }
?>

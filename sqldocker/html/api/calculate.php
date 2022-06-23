<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");

    include_once '../database.php';
    include_once '../class/Clothes.php';
    include_once '../class/Condition.php';      
    $database = new Database();
    $db = $database->getConnection();
    $items = new Clothes($db);
    $stmt = $items->getClothes();
    $itemCount = $stmt->rowCount();
    $condition = new Condition($db);
    $condition->gender = isset($_GET['gender']) ? $_GET['gender'] : die("a");
    $condition->style = isset($_GET['style']) ? $_GET['style'] : die("b");
    $condition->weather = isset($_GET['weather']) ? $_GET['weather'] : die("c");
    $condition->temp = isset($_GET['temp']) ? $_GET['temp'] : die("d");
    $condition->situation = isset($_GET['situation']) ? $_GET['situation'] : die("e");
    if($itemCount > 0){
        $memberArr = array();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            $e = array(
                "clothes_name" => $clothes_name,
                "clothes_type" => $clothes_type,
                "clothes_situation" => $clothes_situation,
                "clothes_style" => $clothes_style,
                "clothes_best_weather" => $clothes_best_weather,
                "clothes_best_temp" => $clothes_best_temp,
                "clothes_color" => $clothes_color,
                "clothes_gender" => $clothes_gender,
                "clothes_detailtype" => $clothes_detailtype
            );
	    $score = $condition->calculate($e);
            $e["score"] = $score; 
            array_push($memberArr, $e);
		
        }
	$col = array_column( $memberArr, "score" );
	array_multisort( $col, SORT_DESC, $memberArr );
	$memberArr = array_slice($memberArr,0,5);
        echo json_encode($memberArr,JSON_UNESCAPED_UNICODE);
    }
    else{
        http_response_code(404);
        echo json_encode(
            array("message" => "No record found.")
        );
    }
?>


<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");

    include_once '../database.php';
    include_once '../class/Clothes.php';
    include_once '../class/Condition.php';      
    $database = new Database();
    $db = $database->getConnection();
    $items = new Clothes($db);
    $items->clothes_style = $_GET['style'];
    $items->clothes_gender = $_GET['gender'];
  
    
    $condition = new Condition($db);
    $condition->gender = isset($_GET['gender']) ? $_GET['gender'] : die("a");
    $condition->style = isset($_GET['style']) ? $_GET['style'] : die("b");
    $condition->weather = isset($_GET['weather']) ? $_GET['weather'] : die("c");
    $condition->temp = isset($_GET['temp']) ? $_GET['temp'] : die("d");
    $condition->situation = isset($_GET['situation']) ? $_GET['situation'] : die("e");
    $stmt = $items->getTopClothes();
   $itemCount = $stmt->rowCount();
    $stmt2 = $items->getBottomClothes();
    $itemCount2 = $stmt2->rowCount();
    $stmt3 = $items->getOuterClothes();
    $itemCount3 = $stmt3->rowcount();
    $stmt4 = $items->getAcceClothes();
    $itemCount4 = $stmt4->rowcount();
    $stmt5 = $items->getShoeClothes();
    $itemCount5 = $stmt5->rowcount();
$answerArr = array();
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
                "clothes_gender" => $clothes_gender,
                "clothes_detailtype" => $clothes_detailtype
            );
	    $score = $condition->calculate($e);
            $e["score"] = $score; 
            array_push($memberArr, $e);
		
        }
	$col = array_column( $memberArr, "score" );
	array_multisort( $col, SORT_DESC, $memberArr );
	$memberArr = array_slice($memberArr,0,1);
	array_push($answerArr,$memberArr);
    }
    

  if($itemCount2 > 0){
        $memberArr = array();
        while ($row = $stmt2->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            $e = array(
                "clothes_name" => $clothes_name,
                "clothes_type" => $clothes_type,
                "clothes_situation" => $clothes_situation,
                "clothes_style" => $clothes_style,
                "clothes_best_weather" => $clothes_best_weather,
                "clothes_best_temp" => $clothes_best_temp,
                "clothes_gender" => $clothes_gender,
                "clothes_detailtype" => $clothes_detailtype
            );
            $score = $condition->calculate($e);
            $e["score"] = $score;
            array_push($memberArr, $e);

        }
        $col = array_column( $memberArr, "score" );
        array_multisort( $col, SORT_DESC, $memberArr );
        $memberArr = array_slice($memberArr,0,1);
	array_push($answerArr,$memberArr);
    }
  if($itemCount3 > 0){
        $memberArr = array();
        while ($row = $stmt3->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            $e = array(
                "clothes_name" => $clothes_name,
                "clothes_type" => $clothes_type,
                "clothes_situation" => $clothes_situation,
                "clothes_style" => $clothes_style,
                "clothes_best_weather" => $clothes_best_weather,
                "clothes_best_temp" => $clothes_best_temp,
                "clothes_gender" => $clothes_gender,
                "clothes_detailtype" => $clothes_detailtype
            );
            $score = $condition->calculate($e);
            $e["score"] = $score;
            array_push($memberArr, $e);

        }
        $col = array_column( $memberArr, "score" );
        array_multisort( $col, SORT_DESC, $memberArr );
        $memberArr = array_slice($memberArr,0,1);
        array_push($answerArr,$memberArr);
    }
  if($itemCount4 > 0){
        $memberArr = array();
        while ($row = $stmt4->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            $e = array(
                "clothes_name" => $clothes_name,
                "clothes_type" => $clothes_type,
                "clothes_situation" => $clothes_situation,
                "clothes_style" => $clothes_style,
                "clothes_best_weather" => $clothes_best_weather,
                "clothes_best_temp" => $clothes_best_temp,
                "clothes_gender" => $clothes_gender,
                "clothes_detailtype" => $clothes_detailtype
            );
            $score = $condition->calculate($e);
            $e["score"] = $score;
            array_push($memberArr, $e);

        }
        $col = array_column( $memberArr, "score" );
        array_multisort( $col, SORT_DESC, $memberArr );
        $memberArr = array_slice($memberArr,0,1);
        array_push($answerArr,$memberArr);
    }
  if($itemCount5 > 0){
        $memberArr = array();
        while ($row = $stmt5->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            $e = array(
                "clothes_name" => $clothes_name,
                "clothes_type" => $clothes_type,
                "clothes_situation" => $clothes_situation,
                "clothes_style" => $clothes_style,
                "clothes_best_weather" => $clothes_best_weather,
                "clothes_best_temp" => $clothes_best_temp,
                "clothes_gender" => $clothes_gender,
                "clothes_detailtype" => $clothes_detailtype
            );
            $score = $condition->calculate($e);
            $e["score"] = $score;
            array_push($memberArr, $e);

        }
        $col = array_column( $memberArr, "score" );
        array_multisort( $col, SORT_DESC, $memberArr );
        $memberArr = array_slice($memberArr,0,1);
        array_push($answerArr,$memberArr);
    }

        echo json_encode($answerArr,JSON_UNESCAPED_UNICODE);

?>


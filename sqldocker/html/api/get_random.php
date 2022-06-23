<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");

    include_once '../database.php';
    include_once '../class/Clothes.php'; 
    $database = new Database();
    $db = $database->getConnection();
    $items = new Clothes($db);
    $items->clothes_gender = $_GET['gender'];
  
  
    $stmt = $items->getRandomTopClothes();
   $itemCount = $stmt->rowCount();
    $stmt2 = $items->getRandomBottomClothes();
    $itemCount2 = $stmt2->rowCount();


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

            array_push($memberArr, $e);
		
        }

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

            array_push($memberArr, $e);

        }

	array_push($answerArr,$memberArr);
    }


        echo json_encode($answerArr,JSON_UNESCAPED_UNICODE);

?>



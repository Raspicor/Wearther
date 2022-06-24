<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    
    include_once '../database.php';
    include_once '../class/Member.php';
    $database = new Database();
    $db = $database->getConnection();
    $items = new Member($db);
    $stmt = $items->getMembers();
    $itemCount = $stmt->rowCount();

    echo json_encode($itemCount);
    if($itemCount > 0){
        $memberArr = array();
        $memberArr["body"] = array();
        $memberArr["itemCount"] = $itemCount;
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            $e = array(
                "member_id" => $member_id,
                "member_gender" => $member_gender,
                "member_favorite_style" => $member_favorite_style,
                "member_nickname" => $member_nickname,
                "member_password" => $member_password,
                "location_name" => $location_name,
            );
            array_push($memberArr["body"], $e);
        }
        echo json_encode($memberArr,JSON_UNESCAPED_UNICODE);
    }
    else{
        http_response_code(404);
        echo json_encode(
            array("message" => "No record found.")
        );
    }
?>

<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Max-Age: 3600");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
    include_once '../database.php';
    include_once '../class/Member.php';
    $database = new Database();
    $db = $database->getConnection();
    $item = new Member($db);
    $item->member_id = isset($_GET['member_id']) ? $_GET['member_id'] : die();
    $item->member_password = isset($_GET['member_password']) ? $_GET['member_password'] : die();
    $item->getSingleMemberLogin();
    if($item->member_id != null){
        // create array
        $emp_arr = array(
            "member_id" =>  $item->member_id,
            "member_gender" => $item->member_gender,
            "member_favorite_style" => $item->member_favorite_style,
            "member_nickname" => $item->member_nickname,
            "member_password" => $item->member_password,
            "location_name" => $item->location_name
        );
        http_response_code(200);
        echo json_encode($emp_arr,JSON_UNESCAPED_UNICODE);
    }
      
    else{
        http_response_code(404);       
       echo json_encode("custom error");
    }
?>

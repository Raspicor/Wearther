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
    $item->getSingleMember();
    if($item->member_id != null){
        // create array
        $emp_arr = array(
            "already" =>  true);

        http_response_code(200);
        echo json_encode($emp_arr,JSON_UNESCAPED_UNICODE);
    }

    else{

        $emp_arr = array(
            "already" =>  false);

        http_response_code(200);
        echo json_encode($emp_arr,JSON_UNESCAPED_UNICODE);
    }
?>


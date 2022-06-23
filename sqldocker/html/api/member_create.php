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
    $data = json_decode(file_get_contents("php://input"));
    $item->member_id = $data->member_id;
    $item->member_gender = $data->member_gender;
    $item->member_favorite_style = $data->member_favorite_style;
$item->member_nickname = $data->member_nickname;
$item->member_password = $data->member_password;
$item->location_name = $data->location_name;

    if($item->createMember()){
        echo 'Member created successfully.';
    } else{
        echo 'Member could not be created.';
    }
?>



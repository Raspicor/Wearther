<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Max-Age: 3600");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
    include_once '../database.php';
    include_once '../class/Post.php';
    $database = new Database();
    $db = $database->getConnection();
    $item = new Post($db);
    $data = json_decode(file_get_contents("php://input"));
    $item->member_id = $data->member_id;
    $item->content = $data->content;
    $item->location_name = $data->location_name;

    if($item->createPost()){
        echo 'post created successfully.';
    } else{
        echo 'post could not be created.';
    }
?>




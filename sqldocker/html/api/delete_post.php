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
    
    $item->post_id = $data->post_id;
    
    if($item->deletePost()){
        echo json_encode("succeed");
    } else{
        echo json_encode("error");
    }
?>

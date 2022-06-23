<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    
    include_once '../database.php';
    include_once '../class/Post.php';
    $database = new Database();
    $db = $database->getConnection();
    $items = new Post($db);
    $items->location_name = $_GET["location_name"];
    $stmt = $items->getNearPosts();
    $itemCount = $stmt->rowCount();
    if($itemCount > 0){
        $memberArr = array();
        $memberArr["body"] = array();
        $memberArr["itemCount"] = $itemCount;
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            $e = array(
                "post_id" => $post_id,
                "member_id" => $member_id,
                "content" => $content,
                "post_date" => $post_date,
                "location_name" => $location_name,
            );
            array_push($memberArr["body"], $e);
        }
        echo json_encode($memberArr);
    }
    else{
        http_response_code(404);
        echo json_encode(
            array("message" => "No record found.")
        );
    }
?>




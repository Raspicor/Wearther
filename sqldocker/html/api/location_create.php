<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");
    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Max-Age: 3600");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
    include_once '../database.php';
    include_once '../class/Location.php';
    $database = new Database();
    $db = $database->getConnection();
    $item = new Location($db);
    $data = json_decode(file_get_contents("php://input"));
    $item->latitude = $data->latitude;
    $item->longitude = $data->longitude;
    $item->location_name = $data->location_name;
    if($item->createLocation()){
        echo 'location created successfully.';
    } else{
        echo 'location could not be created.';
    }
?>

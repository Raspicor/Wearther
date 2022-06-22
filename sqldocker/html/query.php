<?php
include('db_setup.php');

$results = array();

$results = $conn->query("select * from board");

?>
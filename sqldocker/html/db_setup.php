<?php
$mysql_hostname = 'mysql';

$mysql_username = 'kim';
$mysql_password = 'json';
$mysql_database = 'myDB';
$mysql_port = '3306';
$mysql_charset = 'UTF8';

$conn = new mysqli($mysql_hostname,$mysql_username,$mysql_password,$mysql_database,$mysql_port,$mysql_charset);

if ($conn->connect_errno){
    echo '연결실패 : '.$conn->connect_error.'';
}else{
echo 'hello world';
}
?>

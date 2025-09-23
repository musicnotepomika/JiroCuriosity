<?php
require_once "connect.php";
function getAll(){
    $db=connect();
    $stmt=$db->query("SELECT * FROM characters");
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}
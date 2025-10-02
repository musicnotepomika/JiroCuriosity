<?php
require_once "connect.php";
function getAll(){
    $db=connect();
    $stmt=$db->query("SELECT characters.id AS characterId, firstName, lastName, gender, description, deaths, imageURL, name FROM characters INNER JOIN species ON species.id=characters.speciesId");
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getSelected($selectedId){
    $db=connect();
    $stmt=$db->query("SELECT characters.id AS characterId, firstName, lastName, gender, description, deaths, imageURL, name FROM characters INNER JOIN species ON species.id=characters.speciesId WHERE characterId=".$selectedId);
    return $stmt->fetch(PDO::FETCH_ASSOC);
}
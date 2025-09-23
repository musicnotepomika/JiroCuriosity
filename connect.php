<?php
function connect(){
    $dsn='mysql:host=192.168.100.100;dbname=dbcuriosity;charset=utf8mb4';
    $user='jiro';
    $pass='jsegoe21';

    try{
        return new PDO($dsn, $user, $pass);
    }catch(PDOException $e){
        die("connection error: ".$e->getMessage());
    }
}
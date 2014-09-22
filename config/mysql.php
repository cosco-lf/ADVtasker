<?php

$db["prefix"]="smile_";

if ($_SERVER["HTTP_HOST"] == "smile-mile:8888") {

  $db["host"]="localhost";
  $db["user"]="root";
  $db["password"]="root";
  $db["dbname"]="smile-mile";

} else {

    $db["host"]="advseo.mysql";
    $db["user"]="advseo_smile";
    $db["password"]="5iyew6xv";
    $db["dbname"]="advseo_smile";

}

?>
<?php

$array = array();
array_push($array,addLine('text','module_name','Название'));
array_push($array,addLine('text','module_ident','Идентификатор'));
array_push($array,addLine('button','','Отправить'));
$form = generateForm($array);

?>
<?php

$array = array();
array_push($array,addLine('text','module_name','название'));
array_push($array,addLine('text','module_ident','идентификарор'));
array_push($array,addLine('button','','отправить'));
$form = generateForm($array);

?>
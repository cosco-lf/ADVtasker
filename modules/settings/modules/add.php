<?php

$res = mysql_query("SELECT id_module as id, name as caption FROM ".$db['prefix']."modules");
while ($row=@mysql_fetch_assoc($res)) {
    $result[]=$row;

}

$array = array();
array_push($array,addLine('text','module_name','Название'));
array_push($array,addLine('text','module_ident','Идентификатор'));
array_push($array,addLine('select','module_parent','Родительский модуль','','','',$result));
array_push($array,addLine('button','','Отправить'));
$form = generateForm($array);

?>
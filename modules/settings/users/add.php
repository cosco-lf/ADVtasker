<?php

$array = array();

$roles = selectAll($db['prefix'].'roles','1','id_role as id, name as caption');
$groups= selectAll($db['prefix'].'groups','1','id_group as id, name as caption');

array_push($array,addLine('text','login','Логин','Логин'));
array_push($array,addLine('password','pass','Пароль','Пароль'));
array_push($array,addLine('text','name','Имя','Имя'));
array_push($array,addLine('text','email','Email','test@test.ru'));
array_push($array,addLine('text','tel','Телефон','Телефон'));
array_push($array,addLine('text','icq','ICQ',''));
array_push($array,addLine('text','skype','Skype',''));
array_push($array,addLine('textarea','text','Дополнительные сведенья',''));
array_push($array,addLine('file','photo','Аватар',''));
array_push($array,addLine('select','id_role','Роль','','','',$roles));
array_push($array,addLine('select','id_group','Группа','','','',$groups));
array_push($array,addLine('button','','отправить'));

$form = generateForm($array);
?>
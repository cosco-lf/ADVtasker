<?php

$array = array();

$id_user = @$_GET['ID'];
$roles = selectAll($db['prefix'].'roles','1','id_role as id, name as caption');
$groups= selectAll($db['prefix'].'groups','1','id_group as id, name as caption');
$user = selectAll($db['prefix'].'users','4','*','id_user='.$id_user);

if (isset($user['id_user'])) {
//    array_push($array,addLine('text','login','Логин','Логин',$user['login']));
    array_push($array,addLine('text','name','Имя','Имя',$user['name']));
    array_push($array,addLine('text','email','Email','test@test.ru',$user['email']));
    array_push($array,addLine('text','tel','Телефон','Телефон',$user['tel']));
    array_push($array,addLine('text','icq','ICQ','',$user['icq']));
    array_push($array,addLine('text','skype','Skype','',$user['skype']));
    array_push($array,addLine('textarea','text','Дополнительные сведенья','',$user['textblock']));
    array_push($array,addLine('file','photo','Аватар','',$user['photo']));
    array_push($array,addLine('select','id_role','Роль','',$user['id_role'],'',$roles));
    array_push($array,addLine('select','id_group','Группа','',$user['id_group'],'',$groups));
    array_push($array,addLine('button','','Сохранить'));

    $form = generateForm($array);
} else {
    $form = false;
}

?>
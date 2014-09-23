<?php
if (isset($_POST['save'])) {

    $login = trim(@$_POST['login']);
    $pass = trim(@$_POST['pass']);
    $name = trim(@$_POST['name']);
    $email = trim(@$_POST['email']);
    $tel = trim(@$_POST['tel']);
    $icq = trim(@$_POST['icq']);
    $skype = trim(@$_POST['skype']);
    $text = trim(@$_POST['text']);
    $id_role = trim(@$_POST['id_role']);
    $id_group = trim(@$_POST['id_group']);
    $old_file=@$_REQUEST['old_file'];
    $tmp_file = @$_FILES["photo"]["tmp_name"];
    $tmp_number = rand(100,999);
    if(is_uploaded_file($tmp_file) && $tmp_file != '')
    {
        move_uploaded_file($tmp_file, $_SERVER['DOCUMENT_ROOT']."/upload/users/avatar/".$tmp_number.$_FILES["photo"]["name"]);
        $photo = $tmp_number.$_FILES["photo"]["name"];
    } else {
        $photo = $old_file;
    }

    $pass = md5($pass);
    $time = time();
    mysql_query("INSERT INTO ".$db['prefix']."users values (null,'".sql_quote($login)."','".sql_quote($pass)."','".sql_quote($icq)."','".sql_quote($skype)."','".sql_quote($email)."','".sql_quote($tel)."','".sql_quote($name)."','".sql_quote($photo)."','".sql_quote($text)."','".sql_quote($id_role)."','".sql_quote($id_group)."',1,$time,'')");
    if (mysql_error()) {
        $errors[] = 'sql';
    } else {
        header('Location: '.$siteurl.'/settings/users/', true, 301);
        die;
    }

}
?>
<?php
if (isset($_POST['save'])) {

    $id = $_GET['ID'];
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
    mysql_query("UPDATE `".$db['prefix']."users` SET `name`='".sql_quote($name)."', `email`='".sql_quote($email)."', `tel`='".sql_quote($tel)."', `icq`='".sql_quote($icq)."', `skype` ='".sql_quote($skype)."', `textblock`='".sql_quote($text)."', `id_role`='".sql_quote($id_role)."', `id_group`='".sql_quote($id_group)."', `photo` = '".sql_quote($photo)."'WHERE `id_user`=".$id);
    if (mysql_error()) {
        $errors[] = 'sql';
    } else {
        header('Location: '.$siteurl.'/settings/users/', true, 301);
        die;
    }

}
?>
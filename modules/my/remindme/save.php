<?php
if (isset($_POST['save'])) {
    $pass = trim(@$_POST['pass']);
    $pass2 = trim(@$_POST['pass2']);
    $id = trim(@$_POST['id']);

    //Всеобщая проверка
    if ($pass != $pass2) {
        $errors[] = 'incorrect-pass2';
    }
    if ($pass == '') {
        $errors[] = 'pass';
    }


    $mdPassword = md5($pass);

    if (is_array($errors)) {

    } else {
        mysql_query("UPDATE  `smile_users` SET  `pass` =  '".sql_quote($mdPassword)."' WHERE `id` = ".sql_quote($id));
        if (mysql_error()) {
            $errors[] = 'sql';
        } else {
            $user = selectAll('smile_users',4,'*','`id` = "'.$id.'"');
            $_SESSION['login'] = $user['login'];
            $_SESSION['pass'] = $mdPassword;
        }
    }
}
?>
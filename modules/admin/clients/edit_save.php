<?php
if (isset($_POST['save'])) {
    $first = trim(@$_POST['first-name']);
    $second = trim(@$_POST['second-name']);
    $third = trim(@$_POST['third-name']);
    $tel = @$_POST['tel'];
    $num = @$_POST['client_number'];
    $id = @$_POST['id'];


    //Всеобщая проверка
    if ($first == '') {
        $errors[] = 'first';
    }

    if ($num != '') {
        if (!existThis('smile_balance','client_number='.sql_quote($num))) {
            mysql_query('INSERT INTO `smile_balance` (`client_number`) VALUES ("'.sql_quote($num).'")');
        }
    }


    if (is_array($errors)) {

    } else {
        mysql_query("UPDATE `smile_users` SET first='".sql_quote($first)."',second='".sql_quote($second)."', third='".sql_quote($third)."', tel='".sql_quote($tel)."', client_number='".sql_quote($num)."' WHERE `id`='".sql_quote($id)."'");
        if (mysql_error()) {
            $errors[] = 'sql';
        } else {
            header('Location: '.$siteurl.'/admin/clients/', true, 301);
            die;
        }
    }
}
?>
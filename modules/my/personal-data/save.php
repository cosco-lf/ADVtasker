<?php
if (isset($_POST['save'])) {
    $first = trim(@$_POST['first-name']);
    $second = trim(@$_POST['second-name']);
    $third = trim(@$_POST['third-name']);
    $tel = '+'.@$_POST['code'].'('.@$_POST['region'].')'.@$_POST['tel'];
    $dop_tel = @$_POST['dop-tel'];

    if ($first == '') {
        $errors[] = 'first';
    }
    //нет проверки на фамилию и отчесво

    if (is_array($errors)) {

    } else {
        mysql_query("UPDATE  `smile_users` SET  `first` =  '".sql_quote($first)."',`second` = '".sql_quote($second)."',`third` =  '".sql_quote($third)."', `tel` =  '".sql_quote($tel)."' WHERE `id` = ".sql_quote($user['id']));
        if (mysql_error()) {
            $errors[] = 'sql';
        } else {

        }
    }


}
?>
<?php
if ($isAdmin) {

    $lang = @$_POST['lang'];

    if (@$lang == '' && !isset($lang)) {
        $errors[] = 'name';
    }

    if (is_array($errors)) {

    } else {
        mysql_query("insert into `smile_lang` (`name`) values('".sql_quote($lang)."')");
        if (mysql_error()) {
            $errors[] = 'sql';
        } else {
        }
    }
}
?>
<?php
if ($isAdmin) {

    $word = @$_POST['word'];

    if (@$word == '' && !isset($word)) {
        $errors[] = 'word';
    }

    if (is_array($errors)) {

    } else {
        mysql_query("insert into `tasker_words` (`name`) values('".sql_quote($word)."')");
        if (mysql_error()) {
            $errors[] = 'sql';
        } else {
        }
    }
}
?>
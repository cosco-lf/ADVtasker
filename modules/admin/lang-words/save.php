<?php
if ($isAdmin) {
    $langWord = @$_POST['langWord'];
    $lagWordNew = @$_POST['langWordNew'];

    if (isset($langWord) && is_array(@$langWord)) {
        foreach ($langWord as $i => $l) {
            if ($l != '') {
                mysql_query("UPDATE tasker_lang_word SET text='".sql_quote($l)."' WHERE id=".sql_quote($i));
            }
        }
    }
    if (isset($lagWordNew) && is_array(@$lagWordNew)) {
        foreach ($lagWordNew as $i => $l) {
            foreach ($l as $j => $n) {
                if ($l != '') {
                    mysql_query("INSERT INTO tasker_lang_word (`id_lang`,`id_word`,`text`) VALUES ('".sql_quote($i)."','".sql_quote($j)."','".sql_quote($n)."')");
                }
            }
        }
    }
    if (mysql_error()) $errors[] = 'sql';

}
?>
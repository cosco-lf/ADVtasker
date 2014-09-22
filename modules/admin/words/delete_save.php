<?php
if ($isAdmin) {
    if (isset($_POST['save'])) {
        $id = trim(@$_POST['id']);

        if ($id <= 0) {
            $errors[] = 'id';
        }
        if (is_array($errors)) {

        } else {
            mysql_query("DELETE FROM tasker_words WHERE id=".$id);
            if (mysql_error()) {
                $errors[] = 'sql';
                header('Location: '.$siteurl.'/admin/words/?errors[]=sql', true, 301);
                die;
            } else {
                header('Location: '.$siteurl.'/admin/words/', true, 301);
                die;
            }
        }

    }
}
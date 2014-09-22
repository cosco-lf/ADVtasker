<?php
if ($isAdmin) {
    if (isset($_POST['save'])) {
        $id = trim(@$_POST['id']);

        if ($id <= 0) {
            $errors[] = 'id';
        }
        if (is_array($errors)) {

        } else {
            mysql_query("UPDATE tasker_users SET remove=1 WHERE id=".$id);
            if (mysql_error()) {
                $errors[] = 'sql';
                header('Location: '.$siteurl.'/admin/partners/?errors[]=sql', true, 301);
                die;
            } else {
                header('Location: '.$siteurl.'/admin/partners/', true, 301);
                die;
            }
        }

    }
}
?>
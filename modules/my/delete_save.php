<?php
if ($isLogin) {
    if (isset($_POST['save'])) {
        $id = trim(@$_POST['id']);

        if ($id <= 0) {
            $errors[] = 'id';
        }
        if (is_array($errors)) {

        } else {
            mysql_query("DELETE FROM smile_buys WHERE id=".$id." AND date > DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND id_user=".$user['id']);
            if (mysql_error()) {
                $errors[] = 'sql';
                header('Location: '.$siteurl.'/my/?errors[]=sql', true, 301);
                die;
            } else {
                header('Location: '.$siteurl.'/my/', true, 301);
                die;
            }
        }

    }
}
?>
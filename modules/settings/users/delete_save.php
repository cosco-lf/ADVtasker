<?php
/**
 * Created by PhpStorm.
 * User: Руслан
 * Date: 23.09.14
 * Time: 9:40
 */
if (isset($_POST['save']) && isset($_POST['del'])) {
    $id = @$_POST['del'];
    mysql_query("UPDATE `".$db['prefix']."users` SET `delete`=1 WHERE `id_user`=".$id);
    header('Location: '.$siteurl.'/settings/users/', true, 301);
    die;
}
?>
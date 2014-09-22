<?php
if (isset($_POST['save'])) {
    $module_name = trim(@$_POST['module_name']);
    $module_ident = trim(@$_POST['module_ident']);







        mysql_query("INSERT INTO ".$db['prefix']."modules (name,ident) values ('".sql_quote($module_name)."','".sql_quote($module_ident)."')");
        if (mysql_error()) {
            $errors[] = 'sql';
        } else {
            header('Location: '.$siteurl.'/settings/modules/', true, 301);
            die;
        }

}
?>
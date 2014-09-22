<?php
if ($isAdmin) {
    if (isset($_GET['id']) && @$_GET['id']) {
        $exist = true;
        $id = $_GET['id'];
        $client = selectAll('smile_users',4,'*','id='.sql_quote($id));
        if (!is_array(@$client)) {
            $exist = false;
        }
    }
}
?>
<?php
if ($isAdmin) {
    $where = 'rights=1 AND remove=0';
    if (isset($_POST['search']) && @$_POST['search'] != '') {
        $where .= ' AND login LIKE "%'.sql_quote($_POST['search']).'%"';
    }
    $client = selectAll('tasker_users',1,'*',$where,'login');
}
?>
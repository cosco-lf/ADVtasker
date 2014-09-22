<?php
if ($isAdmin) {
    $where = 'rights=10 AND remove=0';
    if (isset($_POST['search']) && @$_POST['search'] != '') {
        $where .= ' AND login LIKE "%'.sql_quote($_POST['search']).'%"';
    }
    $partner = selectAll('tasker_users',1,'*',$where,'login');
    $res = mysql_query('SELECT `*` FROM tasker_formula');
    while ($row=@mysql_fetch_assoc($res)) {
        $formula[$row['id_user']]=$row;
    }
}
?>
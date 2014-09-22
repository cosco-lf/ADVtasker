<?php
if ($isAdmin) {
    $where = 'rights=10 AND remove=0';
    if (isset($_POST['search']) && @$_POST['search'] != '') {
        $where .= ' AND login LIKE "%'.sql_quote($_POST['search']).'%"';
    }
    $partner = selectAll('smile_users',1,'*',$where,'login');
    $res = mysql_query('SELECT `*` FROM smile_formula');
    while ($row=@mysql_fetch_assoc($res)) {
        $formula[$row['id_user']]=$row;
    }
}
?>
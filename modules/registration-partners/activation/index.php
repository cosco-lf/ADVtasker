<?php
if (isset($_GET['key'])) {
    $tmp = explode('_',$_GET['key']);
    if (is_array($tmp) && count(@$tmp) == 3) {
        $login = base64_decode($tmp[0]);
        $pass = base64_decode($tmp[1]);
        $date = base64_decode($tmp[2]);
        if ($date == '' || $login == '' || $pass == '') {
            $key = -1;
        } else {
            if ($date == date('dmY')) {
                $md5Pass = md5($pass);
                $user = selectAll('smile_users',4,'*','`login` = "'.sql_quote($login).'" AND `pass` = "'.sql_quote($md5Pass).'"');
                if ($user) {
                    mysql_query('UPDATE smile_users SET rights=10 WHERE id='.$user['id']);
                    $key = 2;
                    $_SESSION['login'] = $login;
                    $_SESSION['pass'] = $pass;
                }
            } else {
                $key = 1;
            }
        }
    } else {
        $key = -1;
    }

} else {
    $key = 0;
}
?>
<?php
if (isset($_POST['save'])) {
    $pass = trim(@$_POST['pass']);
    $pass2 = trim(@$_POST['pass2']);
    $email = trim(@$_POST['email']);
    $first = trim(@$_POST['first-name']);
    $second = trim(@$_POST['second-name']);
    $third = trim(@$_POST['third-name']);
    $tel = '+'.@$_POST['code'].'('.@$_POST['region'].')'.@$_POST['tel'];

    //Всеобщая проверка
    if ($pass != $pass2) {
        $errors[] = 'incorrect-pass2';
    }
    if ($pass == '') {
        $errors[] = 'pass';
    }
    if ($email == '') {
        $errors[] = 'email';
    } else if (existThis('smile_users','email="'.$email.'"')) {
        $errors[] = 'exist';
    }
    if ($first == '') {
        $errors[] = 'first';
    }
    //нет проверки на фамилию и отчесво

    $mdPassword = md5($pass);
    if (is_array($errors)) {

    } else {

        mysql_query("insert into `smile_users` (login,pass,email,first,second,third,tel) values('".sql_quote($email)."','".sql_quote($mdPassword)."','".sql_quote($email)."','".sql_quote($first)."','".sql_quote($second)."','".sql_quote($third)."','".sql_quote($tel)."')");
        if (mysql_error()) {
            $errors[] = 'sql';
        } else {
//            $_SESSION['login'] = $login;
//            $_SESSION['pass'] = $mdPassword;

            $r['first'] = $first;
            $r['second'] = $second;
            $r['third'] = $third;
            $r['url'] = $siteurl.'/registration/activation/?key='.base64_encode($email).'_'.base64_encode($pass).'_'.base64_encode(date('dmY'));
            mailMe($email,$adminEmail,'Активация пользователя на сайте Smile & Mile',$r,'activation');
            header('Location: '.$siteurl.'/registration/activation/', true, 301);
            die;
        }
    }

}
?>
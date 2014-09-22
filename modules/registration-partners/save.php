<?php
if (isset($_POST['save'])) {
    $login = trim(@$_POST['login']);
    $pass = trim(@$_POST['pass']);
    $pass2 = trim(@$_POST['pass2']);
    $email = trim(@$_POST['email']);
    $name = trim(@$_POST['name']);
    $company = trim(@$_POST['company-name']);
    $detail = trim(@$_POST['details']);
    $airport = trim(@$_POST['airport']);
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
        $errors[] = 'existEmail';
    }
    if ($login == '') {
        $errors[] = 'login';
    } else if (existThis('smile_users','login="'.$login.'"')) {
        $errors[] = 'exist';
    }
    if ($name == '') {
        $errors[] = 'name';
    }


    $mdPassword = md5($pass);
    if (is_array($errors)) {

    } else {
        mysql_query("insert into `smile_users` (login,pass,email,first,tel,company,company_detail,client_number,id_airport) values('".sql_quote($login)."','".sql_quote($mdPassword)."','".sql_quote($email)."','".sql_quote($name)."','".sql_quote($tel)."','".sql_quote($company)."','".sql_quote($detail)."','',".sql_quote($airport).")");
        if (mysql_error()) {
            $errors[] = 'sql';
        } else {

            $r['first'] = $name;
            $r['second'] = '';
            $r['third'] = '';
            $r['url'] = $siteurl.'/registration-partners/activation/?key='.base64_encode($login).'_'.base64_encode($pass).'_'.base64_encode(date('dmY'));
            mailMe($email,$adminEmail,'Активация пользователя на сайте Smile & Mile',$r,'activation');
            header('Location: '.$siteurl.'/registration-partners/activation/', true, 301);
            die;
        }
    }

}
?>
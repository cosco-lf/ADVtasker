<?php
if (isset($_POST['save'])) {
    $email = trim(@$_POST['email']);
    $name = trim(@$_POST['name']);
    $company = trim(@$_POST['company-name']);
    $detail = trim(@$_POST['details']);
    $airport = trim(@$_POST['airport']);
    $tel = @$_POST['tel'];
    $formula = @$_POST['formula'];
    if (@$formula['type'] == 2) {
        $formula['to'] = array_values(@$formula['to']);
        $formula['from'] = array_values(@$formula['from']);
        $formula['percent'] = array_values(@$formula['percent']);
    }
    $id = @$_POST['id'];


    //Всеобщая проверка
    if ($email == '') {
        $errors[] = 'email';
    } else if (existThis('tasker_users','email="'.$email.'" AND id!='.sql_quote($id))) {
        $errors[] = 'existEmail';
    }
    if ($name == '') {
        $errors[] = 'name';
    }

    if (isset($formula['type'])) {
        if ($formula['type'] == 2) {
            $formula['diapazon'] ='';
            foreach ($formula['to'] as $i => $f) {
                $formula['diapazon'] .= $f.'|'.$formula['from'][$i].'|';
            }
            $formula['diapazon'] = substr($formula['diapazon'],0,-1);
            $formula['percent']=implode('|',$formula['percent']);
        } else {
            $formula['diapazon'] = '';
        }
        if (existThis('tasker_formula','id_user='.sql_quote($id))) {
            mysql_query("UPDATE `tasker_formula` SET `type`='".sql_quote($formula['type'])."', `diapazon`='".sql_quote($formula['diapazon'])."', `percent`='".sql_quote($formula['percent'])."' WHERE `id_user`='".sql_quote($id)."'");
        } else {
            mysql_query("INSERT INTO `tasker_formula` (`id_user`,`type`,`diapazon`,`percent`) VALUES ('".sql_quote($id)."','".sql_quote($formula['type'])."','".sql_quote($formula['diapazon'])."','".$formula['percent']."')");
        }
    }


    if (is_array($errors)) {

    } else {
        mysql_query("UPDATE `tasker_users` SET email='".sql_quote($email)."', first='".sql_quote($name)."', tel='".sql_quote($tel)."', company='".sql_quote($company)."',company_detail='".sql_quote($detail)."',id_airport=".sql_quote($airport)." WHERE `id`='".sql_quote($id)."'");
        if (mysql_error()) {
            $errors[] = 'sql';
        } else {
            header('Location: '.$siteurl.'/admin/partners/', true, 301);
            die;
        }
    }
}
?>
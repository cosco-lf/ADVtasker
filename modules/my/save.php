<?php
if ($isLogin) {
    $isFormula = false;
    $where = 'id_user='.$user['id'];
    $formula = selectAll('smile_formula',4,'*',$where);
    if ($formula) {
        $isFormula = true;
    }
    if ($isFormula) {
        if ($_POST['save'] == 3) {
            //добавление
            $date = @$_POST['date'];
            $summa = @$_POST['summa'];
            $client = @$_POST['client'];
            $credits = calculate($formula,$summa);
            if ($date != '' && $summa != '' && $client !='') {
                $date = date("Y-m-d H:i:s",strtotime($date));
                mysql_query("INSERT INTO smile_buys (id_user,client_number,summa,date_buy) VALUES (".$user['id'].",'".sql_quote($client)."','".sql_quote($summa)."','".sql_quote($date)."')");
                $id_post = mysql_insert_id();
                mysql_query("INSERT INTO smile_balance (client_number,type,id_post,summa) VALUE  (".sql_quote($client).",1,$id_post,".sql_quote($credits).")");
            }
        } elseif ($_POST['save'] == 1) {

          $id = @$_POST["id"];
          $date = @$_POST['date'];
          $summa = @$_POST['summa'];
          $client = @$_POST['client'];

          if ($id != '' && $date != '' && $summa != '' && $client !='') {
            mysql_query("UPDATE smile_buys SET client_number='".sql_quote($client)."', summa='".sql_quote($summa)."' WHERE id='".$id."' AND date > DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND id_user=".$user['id']);
            $credits = calculate($formula,$summa);
            mysql_query("UPDATE smile_balance SET client_number='".sql_quote($client)."', summa='".sql_quote($credits)."' WHERE type=1 AND id_post='".$id."'");
          }

        }
    } else {
        die('NO FORMULA');
    }

}
?>
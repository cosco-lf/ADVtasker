<?php

if ($isAdmin) {

  if ($_POST['save'] == 3) {

    // ADD

    $date = @$_POST['date'];
    $summa = @$_POST['summa'];
    $client = @$_POST['client'];

    if ($date != '' && $summa != '' && $client !='') {
      $date = date("Y-m-d H:i:s",strtotime($date));
      mysql_query("INSERT INTO tasker_spends (client_number,summa,date_spend) VALUES ('".sql_quote($client)."','".sql_quote($summa)."','".sql_quote($date)."')");
      $id_post = mysql_insert_id();
      mysql_query("INSERT INTO tasker_balance (client_number,type,id_post,summa) VALUE  (".sql_quote($client).",2,$id_post,".sql_quote($summa).")");
    }

  } elseif ($_POST['save'] == 1) {

    // EDIT

    $id = @$_POST["id"];
    $date = @$_POST['date'];
    $summa = @$_POST['summa'];
    $client = @$_POST['client'];

    if ($id != '' && $date != '' && $summa != '' && $client !='') {
      $date = date("Y-m-d H:i:s",strtotime($date));
      mysql_query("UPDATE tasker_spends SET date_spend='".sql_quote($date)."', client_number='".sql_quote($client)."', summa='".sql_quote($summa)."' WHERE id='".$id."'");
      mysql_query("UPDATE tasker_balance SET client_number='".sql_quote($client)."', summa='".sql_quote($summa)."' WHERE type=2 AND id_post='".$id."'");
    }

  }
}

?>
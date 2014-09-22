<?php
if ($isLogin) {
    $isPartner = false;

    //todo pagination
    if ($user['rights']>=10) {
        $where = 'id_user='.$user['id'];
        $isPartner=true;
        $isFormula = false;
        $formula = selectAll('smile_formula',4,'*',$where);
        if ($formula) {
            $isFormula = true;

        }
        $buys = selectAll('smile_buys',1,'*',$where,'date_buy DESC');
        if (is_array($buys)) {
            foreach ($buys as $i => $b) {
                $buys[$i]['date_print'] = explode(' ',$b['date_buy']);
            }
        }
    } else {
        $cardNum = false;
        if ($user['client_number'] != '') {
            $cardNum = true;
            $where = 'client_number='.$user['client_number'];
            $res = mysql_query("SELECT id,summa as debet,0 as credit,date_buy as date_print FROM smile_buys WHERE ".$where." UNION SELECT id,0 as debet,summa as credit,date_spend as date_print  FROM smile_spends WHERE ".$where." ORDER BY date_print DESC");
            while ($row=@mysql_fetch_assoc($res)) {
                $all[]=$row;
            }
            $res = mysql_query("SELECT * FROM smile_balance WHERE ".$where);
            while ($row=@mysql_fetch_assoc($res)) {
                $post[$row['type']][$row['id_post']] = $row['summa'];
            }
        }

    }

}
?>
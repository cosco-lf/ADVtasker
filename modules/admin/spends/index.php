<?php
if ($isAdmin) {
    $where = '';
    //todo filter
    //todo pagination
    $spends = selectAll('smile_spends',1,'*',$where,'date_spend DESC');
    if (is_array($spends)) {
        foreach ($spends as $i => $b) {
            $spends[$i]['date_print'] = explode(' ',$b['date_spend']);
        }
    }

}
?>
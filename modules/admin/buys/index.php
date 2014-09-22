<?php
if ($isAdmin) {
    $buys = selectAll('smile_buys',1,'*','','date_buy DESC');
    foreach ($buys as $i => $b) {
        $buys[$i]['date_print'] = explode(' ',$b['date_buy']);
    }
}
?>
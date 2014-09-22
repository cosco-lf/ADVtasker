<?php
if ($isLogin == 1) {
    $success = 1;
} else {
    $success = 0;
    $airports = selectAll('smile_airports',1,'*','','IATA');
}
$title = @$lang['regPartnerTitle'];
?>

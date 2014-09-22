<?php
$old = 1;
$id = 0;
if (isset($_GET['key'])) {
    $tmp = explode('_',$_GET['key']);
    if (count($tmp) == 2) {
        $check = selectAll('smile_users',4,'*','id='.$tmp[1].' AND sha1(pass)="'.$tmp[0].'"');
        $id = $tmp[1];
    }
    if (@$check) {
        $old = 0;
    }
}
?>
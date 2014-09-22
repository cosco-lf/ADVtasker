<?php
$tmp = explode('(',@$user['tel']);
$user['code'] = substr(@$tmp[0],1);
$tmp = explode(')',@$tmp[1]);
$user['region'] = @$tmp[0];
$user['tel'] = @$tmp[1];

?>

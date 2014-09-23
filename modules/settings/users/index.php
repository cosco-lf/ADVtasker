<?php

//todo проверка на доступ

$users = selectAll($db['prefix'].'users',1,'*','`delete`=0');
?>
<?php
/**
 * Created by PhpStorm.
 * User: Руслан
 * Date: 22.09.14
 * Time: 18:02
 */
$array = array(
    '1' => array(
        'name' => 'module_name',
        'caption' => 'название',
        'type' => 'text'
    ),
    '2' => array(
        'name' => 'module_ident',
        'caption' => 'идентификарор',
        'type' => 'text'
    ),
    '3' => array(
        'caption' => 'отправить',
        'type' => 'button'
    )
);
$form = generateForm($array);
?>
<?php
$modulesAddress = 'modules/';
$templatesAddress = 'templates/';
$header = $templatesAddress.'themes/header.tpl';
$footer = $templatesAddress.'themes/footer.tpl';
$mainpage = $templatesAddress.'themes/mainpage.tpl';
$mainTpl = $templatesAddress.'themes/mainTpl.tpl';
$tpl404=$templatesAddress.'themes/404.tpl';
$notLogin=$templatesAddress.'themes/standart_auth.tpl';
$siteurl = 'http://'.$_SERVER['HTTP_HOST'];
$current = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
$noGet = explode("?",$current);
$noGet = $noGet[0];


$modules = array('partners','registration','my','admin','registration-partners','clients','buys','spends','remind','settings');
$modAction = array('add','edit','delete');

$setting = selectAll('tasker_settings',4);

$adminEmail = $setting['email'];

?>
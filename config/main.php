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


$modules = array('partners','registration','my','admin','registration-partners','clients','buys','spends','remind');
$modAction = array('add','edit','delete');

$setting = selectAll('smile_settings',4);

//$onPageSearch = $setting['page_search'];
//$onPageUser = $setting['page_lk'];
//$onPageAdmin = $setting['page_admin'];
//
//$userOnPage = 10;
//
//$auto = $setting['auto'];

$adminEmail = $setting['email'];

?>
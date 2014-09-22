<?php
session_start();//ffff
error_reporting(E_ALL);
include_once("config/general.php");
include_once("config/mysql.php");
//wefwefwefwefwe

$errors = '';
connectToDB($db['host'],$db['user'],$db['password'],$db['dbname']);
mysql_set_charset('utf8');
include_once("config/main.php");
include_once("config/lists.php");
$pages = getPagesUrls();
$url = @$_SERVER['REQUEST_URI'];
$getParts = explode("?",$url);
$url = strtok($url,'?');
$urlParts = explode("/",$url);
$modul = generateModulAddress($urlParts);
$subModul = generateSubModulAddress($urlParts);
$ismainpage = false;
$isAdmin = false;
$is404 = false;
//test
// LANGUAGE SETTINGS
if (isset($_GET["lang"])) {
  $langID = (int)$_GET["lang"];
  if (checkExistLang($langID)) {
    $_SESSION["languages"] = $langID;
  }
}
$langID = isset($_SESSION["languages"]) ? $_SESSION["languages"] : 3;
$language = getLanguage($langID);
$lang = getLang($langID);
$langList = getLangList();

$urls = selectAll('smile_rubrics',1,'id,id_sub,url,name,menu','visible=1','sort');
$pages = array();
foreach ($urls as $u) {
  $pages[] = $u['url'];
}

//Разлогиниваемся
if (@$_REQUEST['action'] == 'logout') {
  unset($_SESSION['login']);
  unset($_SESSION['pass']);
  header('Location: /');
  exit;
}
$tryLogin = false;
//если пробует залогинится
if (@$_REQUEST['action'] == 'login') {
  if (isset($_POST['rlogin']) && isset($_POST['rpass'])) {
    $rlogin = $_POST['rlogin'];
    $rpass = md5($_POST['rpass']);
    if (existThis('smile_users','login = "'.sql_quote($rlogin).'" AND pass = "'.sql_quote($rpass).'" AND rights>0 AND remove<=0')) {
      $_SESSION['login'] = $rlogin;
      $_SESSION['pass'] = $rpass;
      header('Location: /');
      exit;
    } else {
      $tryLogin = true;
    }
  }
}
//Напомнить пароль
if (@$_REQUEST['action'] == 'remindme') {
  if (isset($_POST['rEmail'])) {
    $remind = @selectAll('smile_users',4,'*,sha1(`pass`) as url','email="'.sql_quote($_POST['rEmail']).'" OR login="'.sql_quote($_POST['rEmail']).'"');
    if (is_array(@$remind)) {
      $remind['site'] = $siteurl;
      mailMe($remind['email'],$adminEmail,'Напоминание пароля Smile & Mile',$remind,'remindme');
      $goodRemind = true;
    } else $errorRemind = true;
  }
}

//для ajax подгрузки
$ajax = false;
if (isset($_GET['action']) && @$_GET['action'] == 'ajax') {
  $ajax = true;
}

if (isset($_POST["ajax"])) {
  if (isset($_POST["checkExistClient"])) {
    if (empty($_POST["checkExistClient"])) {
      echo "false";
      return;
    }
    if (checkExistClient((int)$_POST["checkExistClient"])) echo "true";
    else echo "false";
  }
  exit;
}

//Залогинены ил нет?
$isLogin = false;
if (isset($_SESSION['login']) && isset($_SESSION['pass'])) {
  $user = selectAll('smile_users',4,'*','`login` = "'.$_SESSION['login'].'"');
  if ($user['rights'] == 999) {
    $isAdmin = true;
  }
  if (is_array($user)) {
    $isLogin = true;
  }
  // CREATE NAME FOR DISPLAY
  if (!empty($user["second"]) || !empty($user["first"]) || !empty($user["third"])) {
    $user["display_name"] = "";
    if (!empty($user["second"])) $user["display_name"] .= $user["second"] . " ";
    if (!empty($user["first"])) $user["display_name"] .= $user["first"] . " ";
    if (!empty($user["third"])) $user["display_name"] .= $user["third"];
  } else $user["display_name"] = $user["email"];
}

//если не главной
if ($urlParts[1] != '') {
//Проверка есть ли такой модуль
  if (in_array($urlParts[1],$modules) && existMod($urlParts)) {
//Проверка на наличия 2ого уровня
    if (isset($urlParts[2]) && $urlParts[2] != '') {
//проверка на стандартные действия
      if (in_array($urlParts[2],$modAction) && existModAction($urlParts)) {
//Проверка на сохранение
        if (isset($_POST['save'])) {
          include($modul['all'].$urlParts[2].'_save.php');
//есть ли ошибки
          if (is_array($errors)) {
            $url = addErrors($errors,$url);

            include($modul[$urlParts[2]]);
            if (!$ajax) {
              include($header);
            }
            include($modul[$urlParts[2].'_tpl']);
          } else {
//ошибок нет удаляем если были в урле
            $url = cleanErrors($url);
            header('Location: '.$url, true, 301);
          }
        } else {
//не сохранение значит просто показываем стандартное действие

          include($modul[$urlParts[2]]);
          if (!$ajax) {
            include($header);
          }
          include($modul[$urlParts[2].'_tpl']);
        }
      } // не стандартно действие значит что то еще
      else {
//проверка на подмодуль
        if (existSubMod($urlParts)) {
//проверка на наличие третьего уровня
          if (isset($urlParts[3]) && $urlParts[3] != '') {
//проверка на стандартное действие
            if (in_array(@$urlParts[3],$modAction) && existModAction($urlParts)) {
//есть ли сохранение
              if (isset($urlParts[4]) && @$urlParts[4] != '') {
//нет у нас такой глубины
//todo do404
                $is404 = true;
              } else {
                if (isset($_POST['save'])) {
                  include($subModul['all'].$urlParts[3].'_save.php');
//есть ли ошибки
                  if (is_array($errors)) {
                    $url = addErrors($errors,$url);

                    include($subModul[$urlParts[3]]);
                    if (!$ajax) {
                      include($header);
                    }
                    include($subModul[$urlParts[3].'_tpl']);
                  } else {
//ошибок нет удаляем если были в урле
                    $url = cleanErrors($url);
                    header('Location: '.$url, true, 301);
                  }
                } else {
//не сохранение значит просто показываем стандартное действие

                  include($subModul[$urlParts[3]]);
                  if (!$ajax) {
                    include($header);
                  }
                  include($subModul[$urlParts[3].'_tpl']);
                }
              }
            } else {
// не стандарт а третьего уровня у нас не бывает, возможно появится а может и нет
//todo do404
              $is404 = true;
            }
          } else {
//нет третьего уровня, значит просто подмодуль
            if (isset($_POST['save'])) {
              include($subModul['save']);
//проверка на наличие ошибок
              if (is_array($errors)) {
                $url = addErrors($errors,$url);

                include($subModul['php']);
                if (!$ajax) {
                  include($header);
                }
                include($subModul['tpl']);
              } else {
//ошибок нет удаляем если были в урле
                $url = cleanErrors($url);
                header('Location: '.$url, true, 301);
              }
            } else {
//Не сохранение значит модуль

              include($subModul['php']);
              if (!$ajax) {
                include($header);
              }
              include($subModul['tpl']);
            }
          }
        } else {
//нет такого подмодуля значит попал не туда
//todo do404
          $is404 = true;
        }
      }
    } else {
//Проверка на сохранение
      if (isset($_POST['save'])) {
        include($modul['save']);
//проверка на наличие ошибок
        if (is_array($errors)) {
          $urlForCheck = $url;
          $url = addErrors($errors,$url);
          include($modul['php']);
          if (!$ajax
            && $urlForCheck != "/registration/"
            && $urlForCheck != "/registration-partners/") {
            include($header);
          }
          include($modul['tpl']);
        } else {
//ошибок нет удаляем если были в урле
          $url = cleanErrors($url);
          header('Location: '.$url, true, 301);
        }
      } else {
//Не сохранение значит модуль
        include($modul['php']);
        if (!$ajax
          && $url != "/registration/"
          && $url != "/registration-partners/") {
          include($header);
        }
        include($modul['tpl']);
      }
    }
  } //не модуль значит будем смотреть что это
  else {
//может это Страница?
    if (in_array($urlParts[1],$pages)) {
      if (isset($urlParts[2]) && @$urlParts[2]!='') {
//todo рубрикатор очень прост нет вложености
        $is404 = true;
      } else {
        $page = selectAll('smile_rubrics',4,'*','url="'.$urlParts[1].'"');
        if (!$ajax) {
          include($header);
        }
        include($mainTpl);
      }
    } //нет... значит не туда попали
    else {
//todo do404
      $is404 = true;
    }
  }
} else {
//если главная
//todo mainpage
  $ismainpage = true;
  if ($isLogin) {
    if ($isAdmin) header("Location: /admin/spends/");
    else header("Location: /partners/");
    exit;
  } else include $mainpage;
}

if (is_resource($link)) mysql_close($link);

// ERROR 404
if ($is404) {
  header('HTTP/1.0 404 Not Found', true, '404');
  include $tpl404;
}

// INCLUDE FOOTER
if (!$ajax && !$ismainpage
    && $url != "/registration/"
    && $url != "/registration-partners/") include $footer;

?>
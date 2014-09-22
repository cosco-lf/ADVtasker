<?php

function connectToDB($dbhost, $dbuser, $dbpass, $dbname) {
    global $link;
    ($link = mysql_pconnect("$dbhost", "$dbuser", "$dbpass")) || die("Couldn't connect to MySQL");
    mysql_select_db("$dbname", $link) || die("Couldn't open db: $dbname. Error if any was: ".mysql_error() );
}

function sql_quote( $value )
{
//	set_magic_quotes_runtime(1);
//	$value = addslashes($value);

    if( get_magic_quotes_gpc() )    {
        $value = stripslashes( $value );
    }
    //check if this function exists
    if( function_exists( "mysql_real_escape_string" ) )    {
        $value = mysql_real_escape_string( $value );
    }
    //for PHP version < 4.3.0 use addslashes
    else  {
        $value = addslashes( $value );
    }
    return $value;
}

function selectAll ($table ,$type = 1, $what = '*', $dopWhere = '', $dopOrder = '', $dopLimit='') {
    global $link;
    if ($dopWhere != '') {
        $dopWhere = 'WHERE '.$dopWhere;
    }
    if ($dopOrder != '') {
        $dopOrder = 'ORDER BY '.$dopOrder;
    }
    if ($dopLimit != '') {
        $dopLimit = "LIMIT ".$dopLimit;
    }
    $res = mysql_query("SELECT ".$what." FROM ".$table." ".$dopWhere." ".$dopOrder." ".$dopLimit, $link);
//    echo "SELECT ".$what." FROM ".$table." ".$dopWhere." ".$dopOrder." ".$dopLimit;
    switch ($type) {
        case 1:
            while ($row=@mysql_fetch_assoc($res)) {
                $result[]=$row;
            }
            break;
        case 2:
            while ($row=@mysql_fetch_array($res)) {
                $result[]=$row;
            }
            break;
        case 3:
            while ($row=@mysql_fetch_row($res)) {
                $result[]=$row;
            }
            break;
        case 4:
            while ($row=@mysql_fetch_assoc($res)) {
                $result=$row;
            }
            break;
        case 5:
            $result = @mysql_num_rows($res);
            break;
        case 6:
            while ($row=@mysql_fetch_assoc($res)) {
                $result[$row['id']]=$row;
            }
            break;
        case 7:
            //только для smile&mile
            while ($row=@mysql_fetch_assoc($res)) {
                $result[$row['id_lang']][$row['id_word']]=$row;
            }
            break;
        default:
            while ($row=@mysql_fetch_assoc($res)) {
                $result[]=$row;
            }
            break;
    }

    if (isset($result)) {
        return $result;
    } else {
        return false;
    }
}

function getPagesUrls() {
    $pages = selectAll('smile_pages',1,'url');
    $pagesUrl = array();
    if ($pages !== false) {
        foreach ($pages as $p) {
            $pagesUrl[] = $p['url'];
        }
    }
    return $pagesUrl;
}

function existMod($module) {
    //todo existMod
    return true;
}
function existModAction($action) {
    //todo existModAction
    return true;
}
function existSubMod($action) {
    $filename = 'modules/'.$action[1].'/'.$action[2].'/index.php';
    if (file_exists($filename)) {
        return true;
    } else {
        return false;
    }
}
function addErrors($errors , $url) {
    if (strpos($url,'?') != false) {
        $url .= '&';
    } else {
        $url .= '?';
    }
    foreach ($errors as $e) {
        $url .= 'error[]='.$e.'&';
    }
    $url = substr($url,0,-1);
    return $url;
}
function cleanErrors( $url) {
    //todo cleanErrors
    return $url;
}
function generateModulAddress($url) {
    $modul['php'] = 'modules/'.$url[1].'/index.php';
    $modul['tpl'] = 'modules/'.$url[1].'/index.tpl';
    $modul['save'] = 'modules/'.$url[1].'/save.php';
    //todo сделать цикл из массива подмодулей
    $modul['add'] = 'modules/'.$url[1].'/add.php';
    $modul['edit'] = 'modules/'.$url[1].'/edit.php';
    $modul['delete'] = 'modules/'.$url[1].'/delete.php';
    $modul['add_save'] = 'modules/'.$url[1].'/add_save.php';
    $modul['edit_save'] = 'modules/'.$url[1].'/edit_save.php';
    $modul['delete_save'] = 'modules/'.$url[1].'/delete_save.php';
    $modul['add_tpl'] = 'modules/'.$url[1].'/add.tpl';
    $modul['edit_tpl'] = 'modules/'.$url[1].'/edit.tpl';
    $modul['delete_tpl'] = 'modules/'.$url[1].'/delete.tpl';
    $modul['all'] = 'modules/'.$url[1].'/';
    return $modul;
}
function generateSubModulAddress($url) {
    $modul['php'] = 'modules/'.$url[1].'/'.@$url[2].'/index.php';
    $modul['tpl'] = 'modules/'.$url[1].'/'.@$url[2].'/index.tpl';
    $modul['save'] = 'modules/'.$url[1].'/'.@$url[2].'/save.php';
    $modul['add'] = 'modules/'.$url[1].'/'.@$url[2].'/add.php';
    $modul['edit'] = 'modules/'.$url[1].'/'.@$url[2].'/edit.php';
    $modul['delete'] = 'modules/'.$url[1].'/'.@$url[2].'/delete.php';
    $modul['add_save'] = 'modules/'.$url[1].'/'.@$url[2].'/add_save.php';
    $modul['edit_save'] = 'modules/'.$url[1].'/'.@$url[2].'/edit_save.php';
    $modul['delete_save'] = 'modules/'.$url[1].'/'.@$url[2].'/delete_save.php';
    $modul['add_tpl'] = 'modules/'.$url[1].'/'.@$url[2].'/add.tpl';
    $modul['edit_tpl'] = 'modules/'.$url[1].'/'.@$url[2].'/edit.tpl';
    $modul['delete_tpl'] = 'modules/'.$url[1].'/'.@$url[2].'/delete.tpl';
    $modul['all'] = 'modules/'.$url[1].'/'.@$url[2].'/';
    return $modul;
}
function existLogin($login) {
    $result = mysql_query("SELECT login FROM smile_users WHERE login = '".$login."'");
    if(mysql_num_rows($result) == 0) {
        return false;
    } else {
        return true;
    }
}

function existThis ($where, $what) {
    $result = mysql_query("SELECT * FROM ".$where." WHERE ".$what);
//    echo "SELECT * FROM ".$where." WHERE ".$what;
    if(mysql_num_rows($result) == 0) {
        return false;
    } else {
        return true;
    }
}
function doBest($value) {
    $value = htmlentities($value, ENT_QUOTES, 'UTF-8');
    return $value;
}


function chooseVacancy($id) {
    $vacancy = selectAll('smile_vacancies',4,'*','id = '.$id);
    return $vacancy;
}
function editVacancies($vacancy,$user,$type = 1) {
    $res = mysql_query("DESCRIBE smile_vacancies");
    while ($row=mysql_fetch_array($res)) {
        if ($row['Field'] != 'id'){
            if ($row['Field'] != 'id_user'){
                $list[]=$row['Field'];
            }
        }
    }
    $sql = '';
    $sql_dop = '';
    foreach ($list as $l) {
        if (isset($vacancy[$l])) {
            // статус может менять только суперадмин
            if ($l == 'status' || $l == 'status_text' || $l == 'cheat' || $l == 'old_status') {
                if ($user['rights'] == 999) {
                    //if update
                    if ($type == 1) {
                        $sql .= "`".$l."` = '".sql_quote($vacancy[$l])."', ";
                        //if new
                    } else if ($type == 2) {
                        $sql .= "'".sql_quote($vacancy[$l])."', ";
                        $sql_dop .= "`".$l."`,";
                    }
                } else {
                    if ($type == 1 && $vacancy[$l] == 0 && $l == 'status') {
                        $sql .= "`".$l."` = '".sql_quote($vacancy[$l])."', ";
                    } else if ($type == 1 && $vacancy[$l] != '' && $l == 'old_status') {
                        $sql .= "`".$l."` = '".sql_quote($vacancy[$l])."', ";
                    } else if ($type == 2 ) {
//                        $sql .= "'".sql_quote($vacancy[$l])."', ";
//                        $sql_dop .= "`".$l."`,";
                    }
                }
            } else {
                //if update
                if ($type == 1) {
                    $sql .= "`".$l."` = '".sql_quote($vacancy[$l])."', ";
                    //if new
                } else if ($type == 2) {
                    $sql .= "'".sql_quote($vacancy[$l])."', ";
                    $sql_dop .= "`".$l."`,";
                }
            }
        } else {
            $vacancy[$l] = '';
            if ($type == 2) {
                $sql .= "'".sql_quote($vacancy[$l])."', ";
                $sql_dop .= "`".$l."`,";
            }
        }
    }
    $sql = substr($sql,0,-2);
    if ($sql_dop != '') {
        $sql_dop = substr($sql_dop,0,-1);
    }
    if ($type == 1) {
        //проверка на суперадмина и на то что это вакансия человека который редактирует
        if ($user['rights'] != 999) {
            if (existThis('smile_vacancies','id = '.$vacancy['id'].' AND id_user = '.$user['id'])) {
                mysql_query("UPDATE  `smile_vacancies` SET  ".$sql." WHERE `id` = ".$vacancy['id']);
//                echo ("UPDATE  `smile_vacancies` SET  ".$sql." WHERE `id` = ".$vacancy['id']);
//                die(mysql_error());
            } else {
                return false;
            }
        } else {
            mysql_query("UPDATE  `smile_vacancies` SET  ".$sql." WHERE `id` = ".$vacancy['id']);
        }
        if (mysql_error()) {
            return false;
        } else {
            return true;
        }
    } else if ($type == 2) {
        mysql_query("insert into `smile_vacancies` (`id`,`id_user`,".$sql_dop.") values(null,".$user['id'].",".$sql.")");
        if (mysql_error()) {
            return false;
        } else {
            return true;
        }
    }
}
function makeVacancyValue ($in = array()) {
    $res = mysql_query("DESCRIBE smile_vacancies");
    while ($row=mysql_fetch_array($res)) {
                $list[]=$row['Field'];
    }
    foreach ($list as $l) {
        if (!isset($in[$l])) {
            $in[$l] = '';
        }
    }
    //разбираем язык
    if (strlen($in['languages']) > 0) {
        $tmp = explode('|',$in['languages']);
        foreach ($tmp as $i => $t) {
            $tmp2 = explode(';',$t);
            $in['lang'][$i+1][1] = $tmp2[0];
            $in['lang'][$i+1][2] = $tmp2[1];
        }
    }
    $prof = readVacancyRubrics(3);
    $in['speciality_name'] = '';
    //разбираем специальность
    if (strlen($in['speciality']) > 0) {
        $tmp = explode(',',$in['speciality']);
        $in['speciality_name'] .= @$prof[$tmp[0]]['name'];
        $in['speciality_name'] .= ' / '.@$prof[$tmp[0]]['child'][$tmp[1]]['name'];
    }

    return $in;
}

function makeRubricsValue ($in = array()) {
    $res = mysql_query("DESCRIBE smile_rubrics");
    while ($row=mysql_fetch_array($res)) {
        $list[]=$row['Field'];
    }
    foreach ($list as $l) {
        if (!isset($in[$l])) {
            $in[$l] = '';
        }
    }
    return $in;
}
function get_client_ip() {
    $ipaddress = '';
    if (@$_SERVER['HTTP_CLIENT_IP'])
        $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
    else if(@$_SERVER['HTTP_X_FORWARDED_FOR'])
        $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
    else if(@$_SERVER['HTTP_X_FORWARDED'])
        $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
    else if(@$_SERVER['HTTP_FORWARDED_FOR'])
        $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
    else if(@$_SERVER['HTTP_FORWARDED'])
        $ipaddress = $_SERVER['HTTP_FORWARDED'];
    else if(@$_SERVER['REMOTE_ADDR'])
        $ipaddress = $_SERVER['REMOTE_ADDR'];
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}
function getCity() {
    $ipclient = get_client_ip();
    $ch = curl_init();
    $headers = array(
        'Accept: application/json',
        'Content-Type: application/json',

    );
    curl_setopt($ch, CURLOPT_URL, "http://api.sypexgeo.net/json/".$ipclient);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $city = curl_exec($ch);
    $city = json_decode($city);
    $city = $city -> city -> name_ru;
//echo $city;
    return $city;
}
function mailMe($to,$from,$subject,$param,$type,$with_files=false) {
//функция отправки e-mail
    $headers  = "MIME-Version: 1.0\n";
    $headers .= "From: $from\n";
    $headers .= "Reply-To: $from\n";
    $zag='';
    switch ($type) {
        case 'remindme':

            $r = $param;
            $r['url'] = $r['site'].'/my/remindme/?key='.$r['url'].'_'.$r['id'];
            ob_start();
            include("templates/mail/remindme.tpl");
            $body = ob_get_contents();
            ob_end_clean();
            break;
        case 'activation':
            $r= $param;
            ob_start();
            include("templates/mail/activation.tpl");
            $body = ob_get_contents();
            ob_end_clean();
            break;
        case 'success':
            $r= $param;
            ob_start();
            include("templates/mail/success.tpl");
            $body = ob_get_contents();
            ob_end_clean();
            break;
        case 'denied':
            $r= $param;
            ob_start();
            include("templates/mail/denied.tpl");
            $body = ob_get_contents();
            ob_end_clean();
            break;
    }
    if (is_Array($_FILES) && (@sizeof($_FILES)>0) && ($with_files==true)) {
        $do_file=false;
        foreach ($_FILES as $FL) {
            if (is_file($FL['tmp_name'])) {
                if ($do_file==false) {
                    $headers.="content-type: multipart/mixed;";
                }
                $do_file=true;
                $f= fopen($FL['tmp_name'],"rb");
                $headers.="boundary=\"----------".$FL["name"]."\"\n\n";
                $zag= "------------".$FL["name"]."\nContent-Type:text/html;\n";
                $zag.= "Content-Transfer-Encoding: 8bit\n\n$body\n\n";
                $zag.= "------------".$FL["name"]."\n";
                $zag.= "Content-Type: application/octet-stream;";
                $zag.= "name=\"".$FL["name"]."\"\n";
                $zag.= "Content-Transfer-Encoding:base64\n";
                $zag.= "Content-Disposition:attachment;";
                $zag.= "filename=\"".$FL["name"]."\"\n\n";
                $zag.= chunk_split(base64_encode(fread($f,filesize($FL['tmp_name']))))."\n";
                fclose($f);
            }
        }
        if ($do_file==false) {
            $headers .= "Content-type: text/html; charset=windows-utf-8\n";
            $zag=$body;
        }
    } else {
        $headers .= "Content-type: text/html; charset=windows-utf-8\n";
        $zag=$body;
    }
    mail($to, $subject, $zag, $headers);
}

function generateMatFilter($mat) {
    $text = '';
    foreach ($mat as $m) {
        $text .= 'AND city NOT LIKE "%'.$m['text'].'%"';
        $text .= 'AND profession NOT LIKE "%'.$m['text'].'%"';
        $text .= 'AND speciality NOT LIKE "%'.$m['text'].'%"';
        $text .= 'AND require_responsibility NOT LIKE "%'.$m['text'].'%"';
        $text .= 'AND require_skills NOT LIKE "%'.$m['text'].'%"';
        $text .= 'AND require_terms NOT LIKE "%'.$m['text'].'%"';
        $text .= 'AND company_name NOT LIKE "%'.$m['text'].'%"';
        $text .= 'AND company_site NOT LIKE "%'.$m['text'].'%"';
        $text .= 'AND contact_name NOT LIKE "%'.$m['text'].'%"';
        $text .= 'AND contact_email NOT LIKE "%'.$m['text'].'%"';
        $text .= 'AND address NOT LIKE "%'.$m['text'].'%"';
    }
    return $text;
}

function readVacancyRubrics_bad ($level=3) {

    $vacRubrics = selectAll('smile_profession',6,'*','level<='.$level,'name');
    $new = array();

    foreach ($vacRubrics as $i => $v) {
        if ($v['level'] == 1) {
            $new[$i] = $v;
        }
    }
    if ($level >=2) {
        foreach ($new as $i => $n) {
            foreach ($vacRubrics as $j => $v) {
                if ($v['level'] == 2 && $v['id_sub'] == $i) {
                    $new[$i]['child'][$j] = $v;
                }
            }
        }
    }
    if ($level >=3) {
        foreach ($new as $i => $n) {
            foreach ($n['child'] as $j => $l) {
                foreach ($vacRubrics as $k => $v) {
                    if ($v['level'] == 3 && $v['id_sub'] == $j) {
                        $new[$i]['child'][$j]['child'][$k] = $v;
                    }
                }
            }
        }
    }

    return $new;
}
function readVacancyRubrics ($level=3) {
    $vacRubrics1 = selectAll('smile_profession',6,'*','level=1','name');
    $vacRubrics2 = selectAll('smile_profession',6,'*','level=2','name');
    $vacRubrics3 = selectAll('smile_profession',6,'*','level=3','name');
    foreach ($vacRubrics2 as $i => $v) {
        $vacRubrics1[$v['id_sub']]['child'][$i] = $v;
    }
    foreach ($vacRubrics3 as $i => $v) {
        foreach ($vacRubrics1 as $j => $papa) {
            if (isset($papa['child'][$v['id_sub']])) {
                $vacRubrics1[$j]['child'][$v['id_sub']]['child'][$i] = $v;
                break;
            }
        }
    }

    return $vacRubrics1;

}

function getLang($language=3) {
    $res = mysql_query("SELECT t1.name,t2.text FROM smile_words t1 INNER JOIN smile_lang_word t2 ON t2.id_word=t1.id WHERE t2.id_lang=".$language);
    while ($row=@mysql_fetch_assoc($res)) {
        $lang[$row['name']]=$row{'text'};
    }
  if (isset($lang)) return $lang;
  else return false;
}
function getLangList() {
  return selectAll('smile_lang',1,'*','visible=1');
}
function getLanguage($langID) {
  $res = mysql_query("SELECT * FROM smile_lang WHERE id=$langID");
  while ($row = mysql_fetch_assoc($res)) $lang = $row;
  if (isset($lang)) return $lang;
  else return false;
}
function checkExistLang($langID) {
  $res = mysql_query("SELECT id FROM smile_lang WHERE id=$langID");
  while ($row = mysql_fetch_assoc($res)) $lang = $row;
  if (isset($lang)) return true;
  else return false;
}

function canEdit($date) {
    if (time() < strtotime($date) + 86400) {
        return true;
    } else {
        return false;
    }
}
//расчет баллов по формуле
function calculate($formula,$money) {
    if ($formula['type']==1) {
        return $money*$formula['percent']/100;
    } else if ($formula['type']==2) {
        $diapazons = explode('|',$formula['diapazon']);
        array_unshift($diapazons,0);
        $persents = explode('|',$formula['percent']);
        for ($i=0;$i <=count($diapazons); $i=$i+2) {
            if ($money > @$diapazons[$i] && $money <= @$diapazons[$i+1]) {
                return $money*$persents[$i/2]/100;
            }
        }
        if ($money > end($diapazons)) {
            return $money*end($persents)/100;
        }

    } else {

        return false;
    }
}

function checkExistClient($clientNumber) {
  $res = mysql_query("SELECT id FROM smile_users WHERE client_number=$clientNumber");
  while ($row = mysql_fetch_assoc($res)) $id = $row;
  if (isset($id)) return true;
  else return false;
}

//timer
//$start = microtime(true);
//$time_taken = microtime(true) - $start;
//echo '|'.$time_taken.'|';
?>
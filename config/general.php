<?php
function connectToDB($dbhost, $dbuser, $dbpass, $dbname) {
    global $link;
    ($link = mysql_pconnect("$dbhost", "$dbuser", "$dbpass")) || die("Couldn't connect to MySQL");
    mysql_select_db("$dbname", $link) || die("Couldn't open db: $dbname. Error if any was: ".mysql_error() );
}

function sql_quote( $value )
{
    if( get_magic_quotes_gpc() )    {
        $value = stripslashes( $value );
    }
    //check if this function exists
    if( function_exists( "mysql_real_escape_string" ) )    {
        $value = mysql_real_escape_string( $value );
    }
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

//timer
//$start = microtime(true);
//$time_taken = microtime(true) - $start;
//echo '|'.$time_taken.'|';

?>
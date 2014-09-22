<?php
    if ($isAdmin) {
        if (isset($_GET['id']) && @$_GET['id']) {
            $exist = true;
            $id = $_GET['id'];
            $partner = selectAll('smile_users',4,'*','id='.sql_quote($id));
            $airports = selectAll('smile_airports',1,'*','','IATA');
            if (!is_array(@$partner)) {
                $exist = false;
            }
            $partner['formula'] = selectAll('smile_formula',4,'*','id_user='.sql_quote($id));
            if (isset($partner['formula']['type']) && @$partner['formula']['type'] == 2) {
                $partner['formula']['percent'] = explode('|',$partner['formula']['percent']);
                $tmp = explode('|',$partner['formula']['diapazon']);
                $i = 1;
                $partner['formula']['from'][] = '';
                foreach ($tmp as $t) {
                    if ($t != '') {
                        if ($i%2==0) {
                            $partner['formula']['from'][] = $t;
                        } else {
                            $partner['formula']['to'][] = $t;
                        }
                        $i++;
                    }
                }
            }
        }
    }
?>
<?php
if ($isAdmin) {
  if (isset($_POST["search"]) && !empty($_POST["search"])) $langg = selectAll('smile_lang',1,'*',"visible=1 AND name='".sql_quote($_POST["search"])."'");
  else $langg = selectAll('smile_lang',1,'*','visible=1');
}
?>
<?php
if ($isAdmin) {
  if (isset($_POST["search"]) && !empty($_POST["search"])) $langg = selectAll('tasker_lang',1,'*',"visible=1 AND name='".sql_quote($_POST["search"])."'");
  else $langg = selectAll('tasker_lang',1,'*','visible=1');
}
?>
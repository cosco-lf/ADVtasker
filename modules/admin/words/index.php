<?php
if ($isAdmin) {
  if (isset($_POST["search"]) && !empty($_POST["search"])) $word = selectAll('tasker_words',6,'*',"name='".sql_quote($_POST["search"])."'");
  else $word = selectAll('tasker_words',1,'*');
}
?>
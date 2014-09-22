<?php
if ($isAdmin) {
  $langg = selectAll('tasker_lang',6);
  $langWord = selectAll('tasker_lang_word',7);
  if (isset($_POST["search"]) && !empty($_POST["search"])) $word = selectAll('tasker_words',6,'*',"name='".sql_quote($_POST["search"])."'");
  else $word = selectAll('tasker_words',6);
}
?>
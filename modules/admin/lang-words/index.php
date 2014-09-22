<?php
if ($isAdmin) {
  $langg = selectAll('smile_lang',6);
  $langWord = selectAll('smile_lang_word',7);
  if (isset($_POST["search"]) && !empty($_POST["search"])) $word = selectAll('smile_words',6,'*',"name='".sql_quote($_POST["search"])."'");
  else $word = selectAll('smile_words',6);
}
?>
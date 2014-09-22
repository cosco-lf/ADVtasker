<? if ($success == 1): ?>

<? include 'blocks/head.tpl'; ?>
<body>
<div class="out out_rel">
  <div class="header">
    <div class="container">
      <div class="header__top">
        <? include 'blocks/language.tpl'; ?>
        <? include 'blocks/logo.tpl'; ?>
      </div>
      <? include 'blocks/header-text.tpl'; ?>
    </div>
    <? include 'blocks/header-login.tpl'; ?>
  </div>
  <div class="wrapper wrapper--registration">
    <div class="container">
      <div class="field">
        <div class="field__wrap">
          <div class="scroll-pane">
            <div class="wrap editing">
              <div class="editing__top"><?=@$lang['regSuccUserCaption'];?></div><br><br>
              <p><?=@$lang['regSuccUserText'];?></p>
              <p><?=@$lang['regSuccUserText2'];?></p><br><br>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="push"></div>
</div>
<? include 'blocks/footer.tpl'; ?>
</body>
</html>

<? else :?>

<? include 'templates/themes/userRegister.tpl';?>

<? endif; ?>
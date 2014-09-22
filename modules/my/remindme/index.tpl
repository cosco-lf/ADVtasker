<div class="wrapper">
  <div class="container">
    <div class="field">
      <div class="field__wrap">
        <div class="scroll-pane">
          <div class="wrap editing">

            <? if ($isLogin == 1): ?>

            <p style="margin-top: 140px"><?=@$lang['youAuthComplete']?></p>

            <? else: ?>

            <? if ($old == 1): ?>

            <p style="margin-top: 140px"><?=@$lang['pageIsOld']?></p>

            <?else :?>

            <div class="editing__top"><?=@$lang['enterNewPassword']?></div>
            <form method="post">
              <div class="editing__form form">
                <div class="form__row input">
                  <div class="input__text"><?=@$lang['regPassUser'];?>:</div>
                  <div class="input__col input__col_343"><input type="password" name="pass" data-required data-password="1"></div>
                </div>
                <div class="form__row input">
                  <div class="input__text"><?=@$lang['regPass2User'];?>:</div>
                  <div class="input__col input__col_343"><input type="password" name="pass2" data-required data-password="2"></div>
                </div>
              </div>

              <div class="editing__row"><button class="btn js-form-submit"><?=@$lang['save']?></button></div>
              <input type="hidden" name="save" value="1">
              <input type="hidden" name="id" value="<?=@$id?>">

            </form>

            <?endif;?>

            <?endif;?>

          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="wrapper">
  <div class="container">
    <div class="field">
      <div class="field__wrap">
        <div class="scroll-pane">
          <div class="wrap editing">
            <div class="editing__top"><?=@$lang['recoveryPassword'];?></div>

            <? if (!isset($goodRemind)): ?>

            <form action="<?=$noGet;?>?action=remindme" method="post">
              <div class="editing__form form">
                <div class="form__row input">
                  <div class="input__text"><?=@$lang['regEmailUser'];?>:</div>
                  <div class="input__col input__col_343"><input type="text" data-required data-email name="rEmail" value="<?=@$_POST['rEmail']?>" placeholder="pochta@pochta.ru"></div>
                  <? if (isset($errorRemind)): ?>
                  <div class="input__error"><?=@$lang['emailNotFound'];?></div>
                  <? endif; ?>
                </div>
              </div>
              <div class="editing__row"><button class="btn js-form-submit"><?=@$lang['recovery'];?></button></div>
            </form>

            <? else: ?>

            <p style="margin-top: 100px;"><?=@$lang['remindSend']?></p>

            <? endif; ?>

          </div>
        </div>
      </div>
    </div>
  </div>
</div>
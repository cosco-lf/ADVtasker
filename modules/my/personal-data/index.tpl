<? if ($isLogin == 1) :?>

  <? if ($isAdmin): ?>
  <? include 'blocks/menu-admin.tpl'; ?>
  <? else: ?>
  <? include 'blocks/menu-user.tpl'; ?>
  <? endif; ?>

  <div class="wrapper">
    <div class="container">
      <div class="field">
        <div class="field__wrap">
          <div class="scroll-pane scroll-pane_mod">
            <div class="wrap editing">
              <div class="editing__top"><?=@$lang['settingsFormName'];?></div>
              <form method="post">
                <div class="editing__form form">
                  <div class="form__row input">
                    <div class="input__text"><?=@$lang['regSecondName'];?>:</div>
                    <div class="input__col input__col_343"><input type="text" name="second-name" value="<?=@$user['second']?>" placeholder="<?=@$lang['lastNamePlaceholder'];?>"></div>
                  </div>
                  <div class="form__row input">
                    <div class="input__text"><?=@$lang['regFirstName'];?>:</div>
                    <div class="input__col input__col_343"><input type="text" name="first-name" value="<?=@$user['first']?>" data-required placeholder="<?=@$lang['firstNamePlaceholder'];?>"></div>
                  </div>
                  <div class="form__row input">
                    <div class="input__text"><?=@$lang['regThirdName'];?>:</div>
                    <div class="input__col input__col_343"><input type="text" name="third-name" value="<?=@$user['third']?>" placeholder="<?=@$lang['middleNamePlaceholder'];?>"></div>
                  </div>
                  <div class="form__row input">
                    <div class="input__text"><?=@$lang['regTel'];?>:</div>
                    <span>+</span>
                    <div class="input__col input__col_63"><input type="text" name="code" value="<?=@$user['code'];?>" placeholder="372"></div>
                    <div class="input__col input__col_63"><input type="text" name="region" value="<?=@$user['region'];?>" placeholder="569"></div>
                    <div class="input__col input__col_85"><input type="text" name="reg" value="<?=@$user['reg'];?>" placeholder="452209"></div>
                  </div>
                </div>
                <div class="editing__row"><button class="btn js-form-submit" type="submit"><?=@$lang['settingsButtonName'];?></button></div>
                <input type="hidden" name="save" value="1" />
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

<? else :?>

  <? include 'templates/themes/standart_auth.tpl';?>

<? endif; ?>
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
          <div class="scroll-pane scroll-pane_mod">
            <div class="wrap editing">
              <div class="editing__top"><?=@$lang['regFormName'];?></div>
              <form method="post">
                <div class="editing__form form">
                  <div class="form__row input">
                    <div class="input__text"><?=@$lang['regEmailUser'];?>:</div>
                    <div class="input__col input__col_343"><input type="text" data-required data-email name="email" value="<?=@$_POST['email']?>" placeholder="pochta@pochta.ru"></div>
                    <?if(is_array($errors)):?>
                    <?if(in_array('exist',@$errors)):?>
                    <div class="input__error"><?=@$lang['emailRegError'];?></div>
                    <?endif;?>
                    <?endif;?>
                  </div>
                  <div class="form__row input">
                    <div class="input__text"><?=@$lang['regPassUser'];?>:</div>
                    <div class="input__col input__col_343"><input type="password" name="pass" data-required data-password="1"></div>
                  </div>
                  <div class="form__row input">
                    <div class="input__text"><?=@$lang['regPass2User'];?>:</div>
                    <div class="input__col input__col_343"><input type="password" name="pass2" data-required data-password="2"></div>
                  </div>
                  <div class="form__row input">
                    <div class="input__text"><?=@$lang['regSecondName'];?>:</div>
                    <div class="input__col input__col_343"><input type="text" data-required name="second-name" value="<?=@$_POST['second-name']?>" placeholder="<?=@$lang['lastNamePlaceholder'];?>"></div>
                  </div>
                  <div class="form__row input">
                    <div class="input__text"><?=@$lang['regFirstName'];?>:</div>
                    <div class="input__col input__col_343"><input type="text" data-required name="first-name" value="<?=@$_POST['first-name']?>" placeholder="<?=@$lang['firstNamePlaceholder'];?>"></div>
                  </div>
                  <div class="form__row input">
                    <div class="input__text"><?=@$lang['regThirdName'];?>:</div>
                    <div class="input__col input__col_343"><input type="text" data-required name="third-name" value="<?=@$_POST['third-name']?>" placeholder="<?=@$lang['middleNamePlaceholder'];?>"></div>
                  </div>
                  <div class="form__row input">
                    <div class="input__text"><?=@$lang['regTel'];?>:</div>
                    <span>+</span>
                    <div class="input__col input__col_63"><input type="text" data-required name="code" value="<?=@$_POST['code'];?>" placeholder="372"></div>
                    <div class="input__col input__col_63"><input type="text" data-required name="region" value="<?=@$_POST['region'];?>" placeholder="569"></div>
                    <div class="input__col input__col_85"><input type="text" data-required name="reg" value="<?=@$_POST['reg'];?>" placeholder="452209"></div>
                  </div>
                </div>
                <div class="editing__row"><button class="btn js-form-submit"><?=@$lang['regGoNext'];?></button></div>
                <input type="hidden" name="save" value="1">
              </form>
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
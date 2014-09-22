<? if ($isLogin == 1) :?>
<? if ($isAdmin): ?>
<? include 'blocks/menu-admin.tpl'; ?>
<? else: ?>
<? include 'blocks/menu-user.tpl'; ?>
<? endif; ?>
<!-- BEGIN wrapper -->
<div class="wrapper">
  <!-- BEGIN container -->
  <div class="container container_rel">
    <div class="field">
      <div class="field__wrap">
        <div class="scroll-pane scroll-pane_mod">
          <!-- BEGIN wrap -->
          <div class="wrap editing">
            <div class="editing__top"><?=@$lang['editUser'];?></div>
            <form method="post">
              <div class="editing__form form">
                <div class="form__row input">
                  <div class="input__text"><?=@$lang['regSecondName'];?>:</div>
                  <div class="input__col input__col_343"><input type="text" name="second-name" value="<?=@$client['second']?>" placeholder="<?=@$lang['lastNamePlaceholder'];?>"></div>
                </div>
                <div class="form__row input">
                  <div class="input__text"><?=@$lang['regFirstName'];?>:</div>
                  <div class="input__col input__col_343"><input type="text" name="first-name" value="<?=@$client['first']?>" data-required placeholder="<?=@$lang['firstNamePlaceholder'];?>"></div>
                </div>
                <div class="form__row input">
                  <div class="input__text"><?=@$lang['regThirdName'];?>:</div>
                  <div class="input__col input__col_343"><input type="text" name="third-name" value="<?=@$client['third']?>" placeholder="<?=@$lang['middleNamePlaceholder'];?>"></div>
                </div>
                <div class="form__row input">
                  <div class="input__text"><?=@$lang['regTel'];?>:</div>
                  <div class="input__col input__col_343"><input type="text" name="tel" value="<?=@$client['tel']?>"></div>
                </div>
                <div class="form__row input">
                  <div class="input__text"><?=@$lang['clientNumber'];?>:</div>
                  <div class="input__col input__col_343"><input type="text" name="client_number" data-required value="<?=@$client['client_number']?>"></div>
                </div>
              </div>
              <div class="editing__row"><button class="btn js-form-submit" type="submit"><?=@$lang['settingsButtonName'];?></button></div>
              <input type="hidden" name="save" value="1">
              <input type="hidden" name="id" value="<?=@$client['id'];?>">
            </form>
          </div>
          <!-- END wrap -->
        </div>
      </div>
    </div>
  </div>
  <!-- END container -->
</div>
<!-- END wrapper -->
<? else :?>
<div class="wrapper">
  <!-- BEGIN container -->
  <div class="container">
    Авторизируйтесь
    <? include 'templates/themes/standart_auth.tpl';?>
  </div>
  <!-- END container -->
</div>
<!-- END wrapper -->
<? endif; ?>
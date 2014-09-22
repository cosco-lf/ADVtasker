<div class="wrapper">
  <div class="container">
    <div class="field">
      <div class="editing">
        <div class="editing__top"><?=@$lang['auth']?></div>
        <form method="post">
          <div class="editing__form form">
            <div class="form__row input">
              <div class="input__text"><?=@$lang['regLoginPartner']?>:</div>
              <div class="input__col input__col_343"><input type="text" name="rlogin" data-required value="<?=@$_POST['login']?>"></div>
            </div>
            <div class="form__row input">
              <div class="input__text"><?=@$lang['regPassUser'];?>:</div>
              <div class="input__col input__col_343"><input type="password" name="rpass" data-required></div>
            </div>
          </div>
          <div class="editing__row"><button class="btn js-form-submit"><?=@$lang['enter'];?></button></div>
          <input type="hidden" name="action" value="login">
        </form>
      </div>
    </div>
  </div>
</div>
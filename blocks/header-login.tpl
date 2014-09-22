<div class="header__log-in log-in">
  <div class="log-in_wrap">
    <form action="<?=$noGet;?>?action=login" method="post">
      <div class="log-in__form form js-log-in-form">
        <div class="form__row">
          <div class="form__col form__col_312">
            <input type="text" placeholder="<?=@$lang['regLoginPartner'];?>:" name="rlogin" value="<?=@$_POST['login'];?>">
          </div>
          <div class="form__col form__col_312">
            <input type="password" placeholder="<?=@$lang['regPassUser'];?>:" name="rpass">
          </div>
        </div>
        <div class="log-in__text">
          <p class="login-error" <?if($tryLogin==1):?> style="display: block;"<?endif;?>><?=@$lang['enterFailed'];?></p>
          <a class="btn btn_nbg" href="/remind/"><?=@$lang['remindMe'];?></a>
        </div>
      </div>
      <button class="btn btn_log js-log" type="submit"><?=@$lang['enter'];?></button>
    </form>
  </div>
</div>
<? include 'blocks/head.tpl'; ?>
<body>
<!-- BEGIN  out-->
<div class="out out_rel">
  <!-- BEGIN header -->
  <div class="header">
    <!-- BEGIN container -->
    <div class="container">
      <!-- BEGIN header__top -->
      <div class="header__top">
        <? include 'blocks/language.tpl'; ?>
        <? include 'blocks/logo.tpl'; ?>
      </div>
      <!-- END header__top -->
      <? include 'blocks/header-text.tpl'; ?>
    </div>
    <!-- END container -->
    <? include 'blocks/header-login.tpl'; ?>
  </div>
  <!-- END header -->
  <!-- BEGIN wrapper -->
  <div class="wrapper wrapper--registration">
    <!-- BEGIN container -->
    <div class="container">
      <div class="field">
        <div class="field__wrap">
          <div class="scroll-pane scroll-pane_mod">
            <!-- BEGIN wrap -->
            <div class="wrap editing">
              <div class="editing__top"><?=@$lang['regFormNamePartner'];?></div>
              <form method="post">
                <div class="editing__form form">
                  <div class="form__row input">
                    <div class="input__text"><?=@$lang['regLoginPartner'];?>:</div>
                    <div class="input__col input__col_343"><input type="text" name="login" value="<?=@$_POST['login']?>" data-required data-email placeholder="pochta@pochta.ru"></div>
                    <?if(is_array($errors)):?>
                    <?if(in_array('exist',@$errors)):?>
                    <div class="input__error"><?=@$lang['loginRegError'];?></div>
                    <?endif;?>
                    <?endif;?>
                  </div>
                  <div class="form__row input">
                    <div class="input__text"><?=@$lang['regEmailPartner'];?>:</div>
                    <div class="input__col input__col_343"><input type="text" name="email" value="<?=@$_POST['email']?>" data-required data-email placeholder="pochta@pochta.ru"></div>
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
                    <div class="input__text"><?=@$lang['regContactPartnerName'];?>:</div>
                    <div class="input__col input__col_343"><input type="text" name="name" value="<?=@$_POST['name']?>" data-required placeholder="<?=@$lang['firstNamePlaceholder'];?>"></div>
                  </div>
                  <div class="form__row input">
                    <div class="input__text"><?=@$lang['regTel'];?>:</div>
                    <span>+</span>
                    <div class="input__col input__col_63"><input type="text" name="code" value="<?=@$_POST['code'];?>" data-required placeholder="372"></div>
                    <div class="input__col input__col_63"><input type="text" name="region" value="<?=@$_POST['region'];?>" data-required placeholder="569"></div>
                    <div class="input__col input__col_85"><input type="text" name="reg" value="<?=@$_POST['reg'];?>" data-required placeholder="452209"></div>
                  </div>
                  <div class="form__row input">
                    <div class="input__text"><?=@$lang['regCompanyName'];?>:</div>
                    <div class="input__col input__col_343"><input type="text" name="company-name" value="<?=@$_POST['company-name']?>" data-required></div>
                  </div>
                  <div class="form__row input textarea">
                    <div class="input__text"><?=@$lang['regCompanyDetails'];?>:</div>
                    <div class="input__col input__col_343">
                      <textarea name="details"><?=@$_POST['details'];?></textarea>
                    </div>
                  </div>
                    <div class="form__row input">
                        <div class="input__text"><?=@$lang['regCompanyAirport'];?>:</div>
                        <div class="input__col input__col_343">
                            <select name="airport">
                                <? foreach ($airports as $i => $a) :?>
                                <option value="<?=$a['id'];?>" <?if (@$_POST['company-name']==$a['id']) :?> selected <?endif;?>><?=$a['IATA'];?>-<?=$a['name_en'];?></option>
                                <? endforeach;?>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="editing__row"><button class="btn js-form-submit"><?=@$lang['regGoNext'];?></button></div>
                <input type="hidden" name="save" value="1" />
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
  <!-- BEGIN push -->
  <div class="push"></div>
  <!-- END push -->
</div>
<!-- END out-->
<? include 'blocks/footer.tpl'; ?>
</body>
</html>
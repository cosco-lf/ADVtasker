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

            <? if (@$exist): ?>

            <div class="editing__top"><?=@$lang['editPartner'];?></div>
            <form method="post">
              <div class="editing__form form">
                <div class="form__row input">
                  <div class="input__text"><?=@$lang['regEmailPartner'];?>:</div>
                  <div class="input__col input__col_343"><input type="text" data-required data-email name="email" value="<?=@$partner['email']?>" placeholder="pochta@pochta.ru"></div>
                  <?if(is_array($errors)):?>
                  <?if(in_array('exist',@$errors)):?>
                  <div class="input__error"><?=@$lang['emailRegError'];?></div>
                  <?endif;?>
                  <?endif;?>
                </div>
                <div class="form__row input">
                  <div class="input__text"><?=@$lang['regContactPartnerName'];?>:</div>
                  <div class="input__col input__col_343"><input type="text" name="name" value="<?=@$partner['first'];?>" data-required placeholder="<?=@$lang['firstNamePlaceholder'];?>"></div>
                </div>
                <div class="form__row input">
                  <div class="input__text"><?=@$lang['regTel'];?>:</div>
                  <div class="input__col input__col_343"><input type="text" name="tel" value="<?=@$partner['tel'];?>"></div>
                </div>
                <div class="form__row input">
                  <div class="input__text"><?=@$lang['regCompanyName'];?>:</div>
                  <div class="input__col input__col_343"><input type="text" name="company-name" value="<?=@$partner['company'];?>" placeholder="<?=@$lang['middleNamePlaceholder'];?>"></div>
                </div>
                <div class="form__row input textarea">
                  <div class="input__text"><?=@$lang['regCompanyDetails'];?>:</div>
                  <div class="input__col input__col_343">
                    <textarea name="details"><?=@$partner['company_detail'];?></textarea>
                  </div>
                </div>
                  <div class="form__row input">
                      <div class="input__text"><?=@$lang['regCompanyAirport'];?>:</div>
                      <div class="input__col input__col_343">
                          <select name="airport">
                              <? foreach ($airports as $i => $a) :?>
                              <option value="<?=$a['id'];?>" <?if (@$partner['id_airport']==$a['id']) :?> selected <?endif;?>><?=$a['IATA'];?>-<?=$a['name_en'];?></option>
                              <? endforeach;?>
                          </select>
                      </div>
                  </div>

                <div class="form__row input">
                  <div class="input__text"><?=@$lang['formula'];?>:</div>
                  <div class="input__col input__col_343">
                    <div class="popup__choice choice">
                      <label class="choice__checkbox"><input value="1" type="radio" name="formula[type]" id="radio_1" <? if (@$partner['formula'][type] == 1):?> checked <?endif;?>><span>Simple</span></label>
                      <label class="choice__checkbox"><input value="2" type="radio" name="formula[type]" id="radio_2" <? if (@$partner['formula'][type] == 2):?> checked <?endif;?>><span>Range</span></label>
                    </div>
                  </div>
                </div>

                  <? if (!is_array(@$partner['formula'])) :?>
                  <div class="aligncenter notChoose" <?if (@$partner['formula']['type'] >0) :?> style="display:none;"<?endif;?>>
                  <p>Not choosed</p>
              </div>

                <div class="cl"></div>
                <?endif;?>


                <div class="simple" style="display: <? if(@$partner['formula']['type'] == 1) echo 'block';?>;">
                    <div class="form__row input">
                        <div class="input__text"><?=@$lang['percent'];?>:</div>
                        <div class="input__col">
                            <? if (!is_array(@$partner['formula']['percent'])) :?>
                            <input name="formula[percent]" type="text" value="<?=@$partner['formula']['percent'];?>"/>
                            <? else :?>
                            <input name="formula[percent]" type="text" value=""/>
                            <?endif;?>
                        </div>
                    </div>
                </div>

                  <div class="range_block" style="display: <? if(@$partner['formula']['type'] == 2) echo 'block';?>;">

                      <div class=" input">
                          <div class="input__text">From:</div>
                          <div class="input__text">To:</div>
                          <div class="input__text"><?=@$lang['percent'];?>:</div>

                          <div class="input__col">
                              <? if (!is_array(@$partner['formula']['percent'])) :?>
                              <div class="range_wrap">
                                  <input name="formula[from][1]" type="text" value=""/>
                                  <input name="formula[to][1]" type="text" value=""/>
                                  <input name="formula[percent][1]" type="text" value=""/>
                                  <a href="#" class="edit_delete js-range_del fr"></a>
                              </div>
                              <div class="range_wrap">
                                  <input name="formula[from][2]" type="text" value=""/>
                                  <input name="formula[to][2]" type="text" value=""/>
                                  <input name="formula[percent][2]" type="text" value=""/>
                                  <a href="#" class="edit_delete js-range_del fr"></a>
                              </div>

                              <? else :?>

                              <? foreach ($partner['formula']['percent'] as $i => $p) :?>

                              <div class="range_wrap">
                                  <input name="formula[from][<?=$i;?>]" type="text" value="<?=@$partner['formula']['from'][$i];?>"/>
                                  <input name="formula[to][<?=$i;?>]" type="text" value="<?=@$partner['formula']['to'][$i];?>"/>
                                  <input name="formula[percent][<?=$i;?>]" type="text" value="<?=@$partner['formula']['percent'][$i];?>"/>
                                  <a href="#" class="edit_delete js-range_del fr"></a>
                              </div>

                              <?endforeach;?>

                              <?endif;?>
                              <a href="#" class="js-range_add">Добавить</a>
                          </div>

                      </div>
                  </div>

              </div>
              <div class="editing__row"><button class="btn js-form-submit" type="submit"><?=@$lang['settingsButtonName'];?></button></div>
              <input type="hidden" name="save" value="1">
              <input type="hidden" name="id" value="<?=@$partner['id'];?>">
            </form>

            <?else :?>

            <p>Partner not exist.</p>

            <?endif;?>

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
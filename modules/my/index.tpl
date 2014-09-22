<? if ($isLogin): ?>

<script type="text/javascript">
  var clientNumberNotFound = '<?=@$lang["clientNumberNotFound"]?>';
</script>

  <? if ($isAdmin): ?>
  <? include 'blocks/menu-admin.tpl'; ?>
  <? else: ?>
  <? include 'blocks/menu-user.tpl'; ?>
  <? endif; ?>

  <div class="wrapper">
    <div class="container container_rel">

      <? if (!$isAdmin && $isPartner && $isFormula): ?>

      <div class="blocktop">
        <form method="post">
          <div class="blocktop__form form">
            <div class="form__row">
              <div class="form__col form__col_142"><input id="datepicker" type="text" name="date" data-required data-date placeholder="12.06.2014"></div>
              <div class="form__col form__col_202"><input type="text" name="client" data-required placeholder="<?=@$lang['clientNumber']?>"></div>
              <div class="form__col form__col_93"><input type="text" name="summa" data-required placeholder="<?=@$lang['sum']?>"></div>
            </div>
          </div>
          <button class="btn js-spends js-form-submit"><i class="ico ico_addwhite"></i> <?=@$lang['add']?></button>
          <input type="hidden" name="save" value="3">
        </form>
      </div>

      <div class="edit js-popup">
        <form method="post">
          <div class="form">
            <div class="form__row">
              <div class="form__col form__col_142"><input id="datepicker2" type="text" name="date" data-required data-date placeholder="12.06.2014"></div>
              <div class="form__col form__col_202"><input type="text" name="client" data-required placeholder="<?=@$lang['clientNumber']?>"></div>
              <div class="form__col form__col_93"><input type="text" name="summa" data-required placeholder="<?=@$lang['sum']?>"></div>
            </div>
          </div>
          <button class="btn js-spends js-form-submit"><?=@$lang['save']?></button>
          <input type="hidden" name="save" value="1">
          <input type="hidden" name="id" value="">
        </form>
      </div>

      <? endif; ?>

      <div class="field">
        <div class="field__wrap">
          <div class="scroll-pane scroll-pane_mod">
            <div class="wrap wrap_mod">

              <? if (!$isAdmin): ?>

                <? if ($isPartner): ?>

                  <form method="post">

                    <table class="table table_date">

                      <tr>
                        <th><?=@$lang['date']?> <i class="ico ico_date"></i></th>
                        <th><?=@$lang['clientNumber']?></th>
                        <th><?=@$lang['sum']?></th>
                        <th></th>
                      </tr>

                      <? if (is_array($buys)): ?>

                      <? foreach ($buys as $p): ?>

                      <tr>
                        <td><?=$p['date_print'][0];?></td>
                        <td><?=$p['client_number'];?></td>
                        <td><?=$p['summa'];?></td>
                        <td>
                          <? if (canEdit($p['date'])): ?>
                          <button class="btntable btntable_change js-edit js-spends-change"><i class="ico ico_edit"></i><?=@$lang['settingsButtonName']?></button>
                          <button class="btntable btntable_delete js-spends-partner-delete"><i class="ico ico_delete"></i><?=@$lang['delete']?></button>
                          <input type="hidden" name="save" value="1" />
                          <input type="hidden" name="id" value="<?=$p['id'];?>" />
                          <? endif;?>
                        </td>
                      </tr>

                      <? endforeach; ?>

                      <? else: ?>

                      <tr>
                        <td colspan="4"><p style="text-align: center;"><?=@$lang['buysNotFound']?></p></td>
                      </tr>

                      <? endif; ?>

                    </table>

                  </form>

                <? else :?>

                  <table class="table table_date">

                    <tr>
                      <th><?=@$lang['date']?> <i class="ico ico_date"></i></th>
                      <th><?=@$lang['debet']?></th>
                      <th><?=@$lang['credit']?></th>
                    </tr>

                    <? if (isset($all) && is_array($all)): ?>

                    <? foreach ($all as $p): ?>

                    <tr>
                      <td><?=substr($p['date_print'],0,strpos($p['date_print'],' '));?></td>
                      <td><? if (isset($post[1][$p['id']])) echo $post[1][$p['id']];?></td>
                      <td><? if (isset($post[2][$p['id']])) echo $post[2][$p['id']];?></td>
                    </tr>

                    <? endforeach; ?>

                    <?else: ?>

                    <tr>
                      <td colspan="3"><p style="text-align: center;"><?=@$lang['spendsNotFound']?></p></td>
                    </tr>

                    <?endif;?>

                  </table>

                <?endif;?>

              <? else: ?>

                <p style="text-align: center; font-weight: bold; font-size: 24px; margin-top: 40px;"><?=@$lang['welcome']?></p>

              <? endif; ?>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

<? else: ?>

  <? include 'templates/themes/standart_auth.tpl' ?>

<? endif; ?>
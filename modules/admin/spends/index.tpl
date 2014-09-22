<? if ($isAdmin): ?>

<script type="text/javascript">
  var clientNumberNotFound = '<?=@$lang["clientNumberNotFound"]?>';
</script>

<? include "blocks/menu-admin.tpl" ?>

<div class="wrapper">

  <div class="container container_rel">

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

    <div class="field">
      <div class="field__wrap">
        <div class="scroll-pane scroll-pane_mod">
          <div class="wrap wrap_mod">
            <table class="table table_partner">
              <tr>
                <th><?=@$lang['date']?> <i class="ico ico_date"></i></th>
                <th><?=@$lang['clientNumber']?></th>
                <th><?=@$lang['sum']?></th>
                <th></th>
              </tr>

              <? if (is_array($spends)): ?>

              <? foreach ($spends as $p): ?>

              <tr>
                <td><?=$p['date_print'][0]?></td>
                <td><?=$p['client_number']?></td>
                <td><?=$p['summa']?></td>
                <td>
                  <button class="btntable btntable_change js-edit js-spends-change"><i class="ico ico_edit"></i><?=@$lang['settingsButtonName']?></button>
                  <button class="btntable btntable_delete js-spends-delete"><i class="ico ico_delete"></i><?=@$lang['delete']?></button>
                  <input type="hidden" name="save" value="1" />
                  <input type="hidden" name="id" value="<?=$p['id'];?>" />
                </td>
              </tr>

              <? endforeach; ?>

              <? else: ?>

              <tr>
                <td colspan="4"><p style="text-align: center;"><?=@$lang['spendsNotFound']?></p></td>
              </tr>

              <? endif; ?>
            </table>
          </div>
        </div>
      </div>
    </div>



  </div>
</div>

<? else: ?>

<? include $notLogin;?>

<? endif; ?>
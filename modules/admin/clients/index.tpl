<? if ($isAdmin): ?>

<? include "blocks/menu-admin.tpl" ?>

<div class="wrapper">

  <div class="container container_rel">

    <div class="search">
      <div class="search__form form search__form--margin">
        <form method="post">
          <div class="form__row"><input type="text" name="search" placeholder="<?=@$lang['clientsLoginOrEmail']?>..."></div>
          <button class="btn btn_search"><i class="ico ico_search"></i></button>
        </form>
      </div>
      <!--<button class="btn js-add"><i class="ico ico_addwhite"></i> <?=@$lang['addNewClient']?></button>-->
    </div>

    <div class="field">
      <div class="field__wrap">
        <div class="scroll-pane scroll-pane_mod">
          <div class="wrap wrap_mod">
            <table class="table table_partners">
              <tr>
                <th><?=@$lang['regEmailUser']?></th>
                <th><?=@$lang['clientNumber']?></th>
                <th></th>
              </tr>

              <? if (is_array($client)): ?>

              <? foreach ($client as $p): ?>

              <tr>
                <td><a href="javascript:void(0)"><?=$p['email']?></a></td>
                <td>
                  <? if (@$p['client_number'] !=''): ?>

                  <?=$p['client_number']?>

                  <?else :?>
                  No
                  <?endif;?>
                </td>
                <td>
                  <button class="btntable btntable_change js-edit" onclick="window.location.href = '<?=$siteurl?>/admin/clients/edit/?id=<?=$p['id']?>'"><i class="ico ico_edit"></i><?=@$lang['settingsButtonName']?></button>
                  <button class="btntable btntable_delete js-delete" onclick="if (confirm('Delete?')) {$('.remove<?=$p["id"];?>').submit(); return false;} else {return false;}"><i class="ico ico_delete"></i><?=@$lang['delete']?></button>
                  <form style="display: none" class="remove<?=$p['id'];?>" action="<?=$siteurl;?>/admin/clients/delete/" method="post">
                    <input type="hidden" name="save" value="1" />
                    <input type="hidden" name="id" value="<?=$p['id'];?>" />
                  </form>
                </td>
              </tr>

              <? endforeach; ?>

              <? else: ?>

              <tr>
                <td colspan="3"><p style="text-align: center;"><?=@$lang['clientsNotFound']?></p></td>
              </tr>

              <?endif;?>

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
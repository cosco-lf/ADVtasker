<? if ($isAdmin): ?>

<? include "blocks/menu-admin.tpl" ?>

<div class="wrapper">

  <div class="container container_rel">

    <div class="field">
      <div class="field__wrap">
        <div class="scroll-pane scroll-pane_mod">
          <div class="wrap wrap_mod">
            <table class="table table_partner">
              <tr>
                <th><?=@$lang['date']?> <i class="ico ico_date"></i></th>
                <th><?=@$lang['clientNumber']?></th>
                <th><?=@$lang['sum']?></th>
              </tr>

              <? if (is_array($buys)): ?>

              <? foreach ($buys as $p): ?>

              <tr>
                <td><?=$p['date_print'][0]?></td>
                <td><?=$p['client_number']?></td>
                <td><?=$p['summa']?></td>
              </tr>

              <? endforeach; ?>

              <? else: ?>

              <tr>
                <td colspan="3"><p style="text-align: center;"><?=@$lang['buysNotFound']?></p></td>
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
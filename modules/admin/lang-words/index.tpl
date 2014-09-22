<? if ($isAdmin): ?>

<? include "blocks/menu-admin.tpl" ?>

<div class="wrapper">

  <div class="container container_rel">

      <div class="search">
          <div class="search__form form">
            <form method="post">
              <div class="form__row"><input type="text" name="search" placeholder="<?=@$lang['enterWords']?>..."></div>
              <button class="btn btn_search"><i class="ico ico_search"></i></button>
            </form>
          </div>
        <button class="btn js-save" data-form="form"><?=@$lang['save']?></button>
      </div>

    <form method="post" id="form">

      <input type="hidden" name="save" value="1">

      <div class="field">
        <div class="field__wrap">
          <div class="scroll-pane scroll-pane_mod">
            <div class="wrap wrap_mod">

              <table class="table table_partner">
                <? $langCount = 1; ?>
                <tr>
                  <th><?=@$lang['words']?></th>
                  <? foreach ($langg as $l): $langCount++; ?>
                  <th><?=$l['name']?></th>
                  <? endforeach; ?>
                </tr>

                <? if (!empty($word)): ?>
                <? foreach ($word as $j => $w): ?>

                <tr>
                  <td><?=$w['name']?></td>

                  <? foreach ($langg as $i => $l): ?>

                  <td>
                    <? if (isset($langWord[$i][$j])): ?>

                    <div class="table__text js-fast-edit"><span data-name="<?=@$langWord[$i][$j]['id'];?>"><?=@$langWord[$i][$j]['text'];?></span> <button class="btntable btntable_edit"></button></div>

                    <? else: ?>

                    <button class="btntable btntable_add js-fast-create" data-name="langWordNew[<?=$i;?>][<?=$j;?>]"><i class="ico ico_add"></i><?=@$lang['add']?></button>

                    <? endif; ?>
                  </td>

                  <?endforeach;?>

                </tr>

                <? endforeach; ?>

                <? else: ?>

                <tr>
                  <td colspan="<?=@$langCount?>"><p style="text-align: center;"><?=@$lang['wordsNotFound']?></p></td>
                </tr>

                <? endif; ?>

              </table>

            </div>
          </div>
        </div>
      </div>

    </form>

  </div>
</div>

<? else: ?>

<? include $notLogin;?>

<? endif; ?>l
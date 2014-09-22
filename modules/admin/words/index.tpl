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
      <button class="btn js-edit"><i class="ico ico_addwhite"></i> <?=@$lang['addWord']?></button>
    </div>

    <div class="edit js-popup">
      <form method="post">
        <div class="form">
          <div class="form__row">
            <div class="form__col form__col_460"><input type="text" name="word" data-required placeholder="<?=@$lang['enterWords']?>"></div>
          </div>
        </div>
        <button class="btn js-form-submit"><?=@$lang['add']?></button>
        <input type="hidden" name="save" value="1">
      </form>
    </div>

    <div class="field">
      <div class="field__wrap">
        <div class="scroll-pane scroll-pane_mod">
          <div class="wrap wrap_mod">
            <table class="table">
              <tr>
                <th><?=@$lang['words']?></th>
                <th></th>
              </tr>

              <? if (is_array($word)): ?>

              <? foreach ($word as $l): ?>

              <tr>
                <td><?=$l['name']?></td>
                <td>
                  <button class="btntable btntable_delete" onclick="if (confirm('Delete?')) {$('.remove<?=$l["id"];?>').submit(); return false;} else {return false;}"><i class="ico ico_delete"></i><?=@$lang['delete']?></button>
                  <form style="display: none" class="remove<?=$l['id'];?>" action="<?=$siteurl;?>/admin/words/delete/" method="post">
                    <input type="hidden" name="save" value="1" />
                    <input type="hidden" name="id" value="<?=$l['id'];?>" />
                  </form>
                </td>
              </tr>

              <? endforeach; ?>

              <? else: ?>

              <tr>
                <td colspan="2"><p style="text-align: center;"><?=@$lang['wordsNotFound']?></p></td>
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
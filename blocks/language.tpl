<div class="header__language language">
  <span class="language__text"><?=@$lang['siteLanguage']?>: </span>
  <div class="language__select select js-select">
    <i class="ico ico_select"></i>
    <span class="select__text js-select-text"><?=$language['name']?></span>
    <input type="hidden" class="js-select-input" value="0">
    <ul class="select__list js-select-list">
      <?foreach($langList as $langListItem):?>
      <li data-id="<?=$langListItem['id']?>">
        <a href="<?=$url."?lang=".$langListItem['id']?>"><?=$langListItem['name']?></a>
      </li>
      <?endforeach;?>
    </ul>
  </div>
</div>
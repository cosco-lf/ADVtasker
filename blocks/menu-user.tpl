<div class="topic">
  <div class="container">

    <ul class="topic_menu menu">
      <li class="menu__item"><a href="/my/"<?if($url=='/my/')echo" class=\"is-active\"";?>><?=@$lang['LC']?></a></li>
      <li class="menu__item"><a href="/partners/"<?if($url=='/partners/')echo" class=\"is-active\"";?>><?=@$lang['partners']?></a></li>
    </ul>

    <? if ($url == "/partners/"): ?>
    <div class="search search_map">
      <div class="search__text"><?=@$lang['searchAirport']?></div>
      <div class="search__form form">
        <div class="form__row"><input type="text" placeholder="<?=@$lang['searchAirportPlaceholder']?>"></div>
        <button class="btn btn_search"><i class="ico ico_search"></i></button>
      </div>
    </div>
    <? endif; ?>

  </div>
</div>
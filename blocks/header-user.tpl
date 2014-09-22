<? if (isset($user['display_name'])): ?>
<div class="header__right header__right_mod">
  <p><?=$user['display_name']?> / <a href="/my/personal-data/" class="btn btn_nbg"><?=@$lang['settings'];?> <i class="ico ico_settings"></i></a></p>
  <p><a href="/?action=logout" class="btn btn_nbg"><?=@$lang['exit'];?> <i class="ico ico_exit"></i></a></p>
</div>
<? endif; ?>
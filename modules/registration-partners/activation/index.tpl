<div class="wrapper">
  <div class="container">
    <div class="field">
      <div class="field__wrap">
        <div class="scroll-pane">
          <div class="wrap">
            <? if ($key == -1): ?>
            <br>
            <br>
            <h1 style="text-align: center;">Неправильный ключ активации!</h1>
            <br>
            <br>
            <? elseif ($key == 0): ?>
            <br>
            <br>
            <h1 style="text-align: center;">Вы успешно зарегистрированны</h1>
            <p style="text-align: center;">Ваш логин зарегистрирован и требует активации!<br>Данные для активации логина на сайте отправлены на почту.</p>
            <br>
            <br>
            <? elseif ($key == 1): ?>
            <br>
            <br>
            <h1 style="text-align: center;">Ссылка просрочена!</h1>
            <p style="text-align: center;">Для активации вашего логина свяжитесь с администрацией ресурса.</p>
            <br>
            <br>
            <? elseif ($key == 2): ?>
            <br>
            <br>
            <h1 style="text-align: center;">Вы успешно активировали логин <b><?=$user['login'];?></b></h1>
            <br>
            <br>
            <? else: ?>
            <br>
            <br>
            <p style="text-align: center;">Страница недоступна. Перейдите на <a href="<?=$siteurl;?>">главную страницу</a>.</p>
            <br>
            <br>
            <? endif; ?>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
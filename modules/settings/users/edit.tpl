<div class="container">
    <? if ($form) :?>
    <h1>Редактирование пользователя</h1>
    <form class="form" method="post" enctype="multipart/form-data">
        <?=$form;?>
    </form>
    <? else :?>
    <p>Данного пользователя не сущестует</p>
    <? endif;?>
</div>
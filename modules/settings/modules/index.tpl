<h1>Модули</h1>
<a href="<?=$siteurl;?>/settings/modules/add/">Добавить модуль</a>
<table class="table">
    <tr>
        <th>id</th>
        <th>Название</th>
        <th>Идентификатор</th>
        <th>action</th>
    </tr>
    <? if (is_array($modules)) :
    foreach ($modules as $m) : ?>
    <tr>
        <td><?=$m['id_module'];?></td>
        <td><?=$m['name'];?></td>
        <td><?=$m['ident'];?></td>
        <td></td>
    </tr>
    <? endforeach;
    endif;?>
</table>
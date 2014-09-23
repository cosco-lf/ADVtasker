<h1>Пользователи</h1>
<a href="<?=$siteurl;?>/settings/users/add/">Добавить пользователя</a>
<table class="table">
    <tr>
        <th>id</th>
        <th>Имя</th>
        <th>Логин</th>
        <th>Группа</th>
        <th>Роль</th>
        <th>action</th>
    </tr>
    <? if (is_array($users)) :
    foreach ($users as $u) : ?>
    <tr>
        <td><?=$u['id_user'];?></td>
        <td><?=$u['name'];?></td>
        <td><?=$u['login'];?></td>
        <td><?=$u['id_group'];?></td>
        <td><?=$u['id_role'];?></td>
        <td><a href="<?=$siteurl;?>/settings/users/edit/?ID=<?=$u['id_user'];?>">edit</a> | <a href="" data-del-id="<?=$u['id_user'];?>" data-url="<?=$siteurl;?>/settings/users/delete/" class="js-del-button">delete</a></td>
    </tr>
    <? endforeach;
    endif;?>
</table>
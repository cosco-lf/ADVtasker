<div class="container">
    <form class="form-inline" method="post">
        <?=$form;?>
    </form>

    <div class="row">
        <form action="" class="form-inline" role="form" method="post">
            <div class="form-group">
                <label for="module_name">Название модуля</label>
                <input type="text" class="form-control" id="module_name" name="module_name" placeholder="Введите название модуля">
            </div>
            <div class="form-group">
                <label for="module_ident">Идентификатор модуля</label>
                <input type="text" class="form-control" id="module_ident" name="module_ident" placeholder="Введите идентификатор модуля">
            </div>
            <div class="form-group">

                <input type="hidden" class="form-control" name="save" value="1">
            </div>

            <button type="submit" class="btn btn-default">Добавить</button>
        </form>
    </div>
</div>
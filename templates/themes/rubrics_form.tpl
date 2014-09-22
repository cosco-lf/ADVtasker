<form method="post" class="rubrics_form" action="">
    <div class="content">
        <div class="vacancy_block">
            <div class="vacancy_heading">
                <h3 class="vacancy_title">Родительский пункт</h3>
            </div>
            <div class="vacancy_block_inner">
                <div class="selector_wrap">
                    <select name="id_sub">
                        <option value="0" <? if ($rubric['id_sub'] == 0): echo 'selected'; endif; ?>>Корневой раздел</option>
                        <? if (is_array($urls)) :?>
                        <? foreach ($urls as $u) :?>
                        <option value="<?=$u['id'];?>" <? if ($rubric['id_sub'] == $u['id']): echo 'selected'; endif; ?>><?=$u['name'];?></option>
                        <? endforeach;?>
                        <?endif;?>
                    </select>
                </div>
                <div class="cl"></div>
            </div>
        </div>
        <div class="vacancy_block">
            <div class="vacancy_heading">
                <h3 class="vacancy_title">Название</h3>
            </div>
            <div class="vacancy_block_inner">
                <div class="input_wrap">
                    <input type="text" name="name" value="<?=$rubric['name'];?>">
                </div>
                <div class="cl"></div>
            </div>
        </div>
        <div class="vacancy_block">
            <div class="vacancy_heading">
                <h3 class="vacancy_title">Url</h3>
            </div>
            <div class="vacancy_block_inner">
                <div class="input_wrap">
                    <input type="text" name="url" value="<?=$rubric['url'];?>">
                </div>
                <div class="cl"></div>
            </div>
        </div>
        <div class="vacancy_block">
            <div class="vacancy_heading">
                <h3 class="vacancy_title">Контент</h3>
            </div>
            <div class="vacancy_block_inner">
                <div class="input_wrap">
                    <textarea style="height: 350px;" class="mce" name="content"><?=$rubric['content'];?></textarea>
                </div>
                <div class="cl"></div>
            </div>
        </div>
        <div class="vacancy_block">
            <div class="vacancy_heading">
                <h3 class="vacancy_title">СЕО-поля</h3>
            </div>
            <div class="vacancy_block_inner">
                <div class="input_wrap">
                    <div class="sel_label">Title</div>
                    <input type="text" name="title" value="<?=$rubric['title'];?>">
                </div>
                <div class="input_wrap">
                    <div class="sel_label">Keywords</div>
                    <input type="text" name="keywords" value="<?=$rubric['keywords'];?>">
                </div>
                <div class="input_wrap">
                    <div class="sel_label">Meta</div>
                    <input type="text" name="meta" value="<?=$rubric['meta'];?>">
                </div>
                <div class="cl"></div>
            </div>
        </div>
        <div class="vacancy_block">
            <div class="vacancy_heading">
                <h3 class="vacancy_title">Сортировка</h3>
            </div>
            <div class="vacancy_block_inner">
                <div class="input_wrap">
                    <input type="text" name="sort" value="<?=$rubric['sort'];?>">
                </div>
                <div class="cl"></div>
            </div>
        </div>
        <div class="vacancy_block">
            <div class="vacancy_heading">
                <h3 class="vacancy_title">Видимость</h3>
            </div>
            <div class="vacancy_block_inner">
                <div class="checkbox_wrap">
                    <input id="checkbox_1" type="checkbox" name="menu" <? if ($rubric['menu'] == 1 || $rubric['menu'] == '' ):?> checked <?endif;?>  >
                    <label for="checkbox_1">Показывать в меню</label>
                </div>
                <div class="checkbox_wrap">
                    <input id="checkbox_2" type="checkbox" name="visible" <? if ($rubric['visible'] == 1 || $rubric['visible'] == '' ):?> checked <?endif;?>  >
                    <label for="checkbox_2">Видимость</label>
                </div>
                <div class="aligncenter">

                    <a href="#" onclick="$(this).parents('form').submit(); return false;" class="button">Сохранить</a>
                    <input type="hidden" name="save" value="1" />
                    <input type="hidden" name="id" value="<?=$rubric['id'];?>" />

                </div>
                <div class="cl"></div>
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">
    tinymce.init({
        selector: "textarea.mce",
        plugins: [
            "advlist autolink lists charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste moxiemanager"
        ]
    });
    $(document).ready(function() {
         var name = $('[name="name"]'),
                 url = $('[name="url"]'),
                 sort = $('[name="sort"]');
        makeMask(5,name);
        makeMask(1,sort);
        makeMask(8,url);
        name.keyup(function() {errorCheck(1,name,2)});
        url.keyup(function() {
            url.val(url.val().toLowerCase());
            errorCheck(1,url,3);
        });
        if (sort.val() == '') sort.val('0');
        $('form.rubrics_form').submit(function() {
            var error = errorCheck(1,name,2) + errorCheck(1,url,2);
            if (error == 0) {
                return true;
            } else {
                return false;
            }
        })

    })
</script>
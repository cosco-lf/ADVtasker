<div class="sidebar">
    <div class="small_tooltip">
        <div>
            <span>Найдено <b class="js-kol-vo"></b> вакансий. <a class="js-make-search" href="#">Показать</a></span>
        </div>
    </div>
    <div class="selector_wrap">
        <a href="#" class="selector"><? if (isset($param['place_of_work']) && isset($placeOfWork[$param['place_of_work']])) : echo $placeOfWork[$param['place_of_work']]; else :?>Место работы<?endif;?></a>
        <div class="selector_content">
            <ul class="pseudo_select">
                <li data-value="0" data-text="Место работы">Все</li>
                <? foreach ($placeOfWork as $i => $s) : ?>
                <li <? if (isset($param['place_of_work']) && @$param['place_of_work'] == $i) :?>class="selected"<?endif;?> data-value="<?=$i;?>"><?=$s;?></li>
                <? endforeach;?>
            </ul>
        </div>
        <input type="hidden" value="<? if (isset($param['place_of_work'])) { echo $param['place_of_work'];}?>" name="param[place_of_work]" />
    </div>
    <div class="selector_wrap">
        <a href="#" class="selector"><? if (isset($param['speciality']) && isset($speciality[$param['speciality']])) : echo $prof[$param['speciality']]['name']; else :?>Профессиональная отрасль<?endif;?></a>
        <div class="selector_content">
            <ul class="pseudo_select">
                <li data-value="0" data-text="Профессиональная отрасль">Все</li>
                <? foreach ($prof as $i => $pr) : ?>
                <li <? if (isset($param['speciality']) && @$param['speciality'] == $i) :?>class="selected"<?endif;?> data-value="<?=$pr['id'];?>">
                <?=$pr['name'];?>
                </li>
                <? endforeach;?>

            </ul>
        </div>
        <input type="hidden" value="<? if (isset($param['speciality'])) { echo $param['speciality'];}?>" name="param[speciality]" />
    </div>

    <div class="price_sel">
        <div class="doxod">Доход:<span class="fr"><b class="js-min">1</b> 000 - <b class="js-max">250</b> 000 р.</span></div>
        <div class="price_line">
            <a href="#" class="js-contols price_sel_l"></a>
            <a href="#" class="js-contols price_sel_r"></a>
            <div class="price_line_range"></div>
        </div>
        <input type="hidden" name="param[salary_from]" value="">
        <input type="hidden" name="param[salary_to]" value="">
        <input type="hidden" name="const[salary_from]" value="1">
        <input type="hidden" name="const[salary_to]" value="250">
    </div>

    <div class="selector_wrap">
        <a href="#" class="selector"><? if (isset($param['type_of_work']) && isset($typeOfWork[$param['type_of_work']])) : echo $typeOfWork[$param['type_of_work']]; else :?>Тип занятости<?endif;?></a>
        <div class="selector_content">
            <ul class="pseudo_select">
                <li data-value="0" data-text="Тип занятости">Все</li>
                <? foreach ($typeOfWork as $i => $s) : ?>
                <li <? if (isset($param['type_of_work']) && @$param['type_of_work'] == $i) :?>class="selected"<?endif;?> data-value="<?=$i;?>"><?=$s;?></li>
                <? endforeach;?>
            </ul>
        </div>
        <input type="hidden" value="<? if (isset($param['type_of_work'])) { echo $param['type_of_work'];}?>" name="param[type_of_work]" />
    </div>
    <div class="old_wrap">
        <div class="input_wrap one_half fl">
            <input type="text" placeholder="Возраст от" value="<? if (isset($param['old_from'])) { echo $param['old_from'];}?>" name="param[old_from]"/>
        </div>
        <div class="input_wrap one_half fr">
            <input type="text" placeholder="Возраст до" value="<? if (isset($param['old_to'])) { echo $param['old_to'];}?>" name="param[old_to]"/>
        </div>
        <div class="cl"></div>
    </div>

    <div class="selector_wrap">
        <a href="#" class="selector"><? if (isset($param['sex']) && @$param['sex'] == 1) : echo 'Мужской'; elseif (isset($param['sex']) && @$param['sex'] == 2) : echo 'Женский'; else :?>Пол<?endif;?></a>
        <div class="selector_content">
            <ul class="pseudo_select">
                <li data-value="0" data-text="Пол">Любой</li>
                <li <? if (isset($param['sex']) && @$param['sex'] == 1) :?>class="selected"<?endif;?> data-value="1">Мужской</li>
                <li <? if (isset($param['sex']) && @$param['sex'] == 2) :?>class="selected"<?endif;?> data-value="2">Женский</li>
            </ul>
        </div>
        <input type="hidden" value="<? if (isset($param['sex'])) { echo $param['sex'];}?>" name="param[sex]" />
    </div>

    <div class="selector_wrap">
        <a href="#" class="selector"><? if (isset($param['education']) && isset($education[$param['education']])) : echo $education[$param['education']]; else :?>Образование<?endif;?></a>
        <div class="selector_content">
            <ul class="pseudo_select">
                <li data-value="0" data-text="Образование">Любое</li>
                <? foreach ($education as $i => $s) : ?>
                <li <? if (isset($param['education']) && @$param['education'] == $i) :?>class="selected"<?endif;?> data-value="<?=$i;?>"><?=$s;?></li>
                <? endforeach;?>
            </ul>
        </div>
        <input type="hidden" value="<? if (isset($param['education'])) { echo $param['education'];}?>" name="param[education]" />
    </div>
    <div class="selector_wrap">
        <a href="#" class="selector"><? if (isset($param['prava'])) : echo $param['prava']; else :?>Права<?endif;?></a>
        <div class="selector_content">
            <ul class="pseudo_select">
                <li data-value="0" data-text="Права">Не важно</li>
                <li <? if (isset($param['prava']) && @$param['prava'] == 'A') :?>class="selected"<?endif;?> data-value="A">A</li>
                <li <? if (isset($param['prava']) && @$param['prava'] == 'B') :?>class="selected"<?endif;?> data-value="B">B</li>
                <li <? if (isset($param['prava']) && @$param['prava'] == 'C') :?>class="selected"<?endif;?> data-value="C">C</li>
                <li <? if (isset($param['prava']) && @$param['prava'] == 'D') :?>class="selected"<?endif;?> data-value="D">D</li>
                <li <? if (isset($param['prava']) && @$param['prava'] == 'E') :?>class="selected"<?endif;?> data-value="E">E</li>
            </ul>
        </div>
        <input type="hidden" value="<? if (isset($param['prava'])) { echo $param['prava'];}?>" name="param[prava]" />
    </div>
    <div class="selector_wrap">
        <a href="#" class="selector"><? if (isset($param['lang']) && isset($lang[$param['lang']])) : echo $lang[$param['lang']]; else :?>Иностранные языки<?endif;?></a>
        <div class="selector_content">
            <ul class="pseudo_select">
                <li data-value="0" data-text="Иностранные языки">Не важно</li>
                <? foreach ($lang as $i => $s) : ?>
                <li <? if (isset($param['lang']) && @$param['lang'] == $i) :?>class="selected"<?endif;?> data-value="<?=$i;?>"><?=$s;?></li>
                <? endforeach;?>
            </ul>
        </div>
        <input type="hidden" value="<? if (isset($param['lang'])) { echo $param['lang'];}?>" name="param[lang]" />
    </div>
    <div class="selector_wrap">
        <a href="#" class="selector"><? if (isset($param['sex_status']) && isset($sexStatus[$param['sex_status']])) : echo $sexStatus[$param['sex_status']]; else :?>Семейное положение<?endif;?></a>
        <div class="selector_content">
            <ul class="pseudo_select">
                <li data-value="0" data-text="Семейное положение">Не важно</li>
                <? foreach ($sexStatus as $i => $s) : ?>
                <li <? if (isset($param['sex_status']) && @$param['sex_status'] == $i) :?>class="selected"<?endif;?> data-value="<?=$i;?>"><?=$s;?></li>
                <? endforeach;?>
            </ul>
        </div>
        <input type="hidden" value="<? if (isset($param['sex_status'])) { echo $param['sex_status'];}?>" name="param[sex_status]" />
    </div>
    <div class="selector_wrap">
        <a href="#" class="selector"><? if (isset($param['children']) && @$param['children'] == 1) : echo 'Да'; elseif (isset($param['children']) && @$param['children'] == 2) : echo 'Нет'; else :?>Дети<?endif;?></a>
        <div class="selector_content">
            <ul class="pseudo_select">
                <li data-value="0" data-text="Дети">Не важно</li>
                <li <? if (isset($param['children']) && @$param['children'] == 1) :?>class="selected"<?endif;?> data-value="1">Да</li>
                <li <? if (isset($param['children']) && @$param['children'] == 2) :?>class="selected"<?endif;?> data-value="2">Нет</li>
            </ul>
        </div>
        <input type="hidden" value="<? if (isset($param['children'])) { echo $param['children'];}?>" name="param[children]" />
    </div>
    <input type="submit" value="найти вакансии" class="button_small upper js-make-search" />
    <a href="#" class="reset_form">очистить форму</a>
</div>
<?
if (@$param['salary_from'] != 0) {
    $start = @$param['salary_from'];
} else {
    $start = 1;
}
if (@$param['salary_to'] != 0) {
    $end = @$param['salary_to'];
} else {
    $end = 250;
}
?>
<script type="text/javascript">
    $(document).ready(function(){
        movePriceSel(<?=$start.','.$end;?>);
    })
</script>
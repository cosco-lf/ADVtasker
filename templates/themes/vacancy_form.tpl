<div class="right_sidebar">
    <div class="accordion">

        <div class="acc">
            <a href="#" class="tog <? if ($vacancy['experience_from'] > 0 || $vacancy['experience_to'] > 0):?>current<?endif;?>"><span class="icon_plus"></span>Опыт работы</a>
        </div>
        <div class="acc">
            <a href="#" class="tog <? if (strlen($vacancy['prava']) > 0):?>current<?endif;?>"><span class="icon_plus"></span>Водительские права</a>
        </div>
        <div class="acc">
            <a href="#" class="tog <? if ($vacancy['education'] > 0):?>current<?endif;?>"><span class="icon_plus"></span>Уровень образования</a>
        </div>
        <div class="acc">
            <a href="#" class="tog <? if (is_array(@$vacancy['lang'])):?>current<?endif;?>"><span class="icon_plus"></span>Иностранные языки</a>
        </div>
        <div class="acc">
            <a href="#" class="tog <? if ($vacancy['sex'] > 0):?>current<?endif;?>"><span class="icon_plus"></span>Пол</a>
        </div>
        <div class="acc">
            <a href="#" class="tog <? if ($vacancy['old_from'] > 0 || $vacancy['old_to'] > 0):?>current<?endif;?>"><span class="icon_plus"></span>Возраст</a>
        </div>
        <div class="acc">
            <a href="#" class="tog <? if ($vacancy['sex_status'] > 0):?>current<?endif;?>"><span class="icon_plus"></span>Семейное положение</a>
        </div>
        <div class="acc">
            <a href="#" class="tog <? if ($vacancy['children'] > 0):?>current<?endif;?>"><span class="icon_plus"></span>Дети</a>
        </div>
        <!---div class="acc">
            <a href="#" class="tog"><span class="icon_plus"></span>Метро</a>
        </div--->
    </div>
</div>
<form method="post" class="vacancy_form" action="">
<div class="content">
    <div class="vacancy_block">
        <div class="vacancy_heading">
            <h3 class="vacancy_title">Город</h3>
        </div>
        <div class="vacancy_block_inner">
            <div class="input_wrap">
                <input type="text" name="vacancy[city]" value="<?if ($vacancy['city'] == '') :?><?=$city;?><?else :?><?=$vacancy['city'];?><? endif;?>">
            </div>
            <div class="cl"></div>
        </div>
    </div>
    <div class="vacancy_block">
        <div class="vacancy_heading">
            <h3 class="vacancy_title">Должность</h3>
        </div>
        <div class="vacancy_block_inner">
            <div class="input_wrap">
                <input placeholder="Название вакансии" type="text" name="vacancy[profession]" value="<?=$vacancy['profession'];?>"/>
            </div>
            <!---div class="selector_wrap">
                <select name="vacancy[speciality]">
                    <? foreach ($speciality as $i => $s) : ?>
                    <option value="<?=$i;?>" <? if ($vacancy['speciality'] == $i): echo 'selected'; endif; ?>><?=$s;?></option>
                    <? endforeach;?>
                </select>
            </div--->
            <div class="input_wrap">
                <input placeholder="Выберите отрасль" type="text"  value="<?=$vacancy['speciality_name'];?>"	name="vacancy[speciality_name]" class="tree_input"  readonly/>
                <input type="hidden" name="vacancy[speciality]"  value="<?=$vacancy['speciality'];?>" readonly/>
                <ul id="speciality_treemenu" class="treeview" style="display: none;">
                <? foreach ($prof as $i => $c0) : ?>
                    <li data-id="<?=$c0['id'];?>"><?=$c0['name'];?>
                        <?if (is_array(@$c0['child'])) : ?>
                        <ul>
                            <? foreach ($c0['child'] as $j => $c1) :?>
                            <li data-id="<?=$c1['id'];?>"><?=$c1['name'];?>
                                <?if (is_array(@$c1['child'])) : ?>
                                <ul>
                                    <? foreach ($c1['child'] as $k => $c2) :?>
                                    <li class="js-be-prof" data-id="<?=$c2['id'];?>"><?=$c2['name'];?>

                                    </li>
                                    <?endforeach;?>
                                </ul>
                                <?endif;?>
                            </li>
                            <?endforeach;?>
                        </ul>
                        <?endif;?>
                    </li>
                <? endforeach;?>
                </ul>
            </div>
            <div class="row_wrap">
                <div class="two_col fl">
                    <div class="sel_label">График работы:</div>
                    <select name="vacancy[type_of_work]" class="sel_small">
                        <? foreach ($typeOfWork as $i => $s) : ?>
                        <option value="<?=$i;?>" <? if ($vacancy['type_of_work'] == $i): echo 'selected'; endif; ?>><?=$s;?></option>
                        <? endforeach;?>
                    </select>
                </div>
                <div class="two_col fl">
                    <div class="sel_label">Рабочее место:</div>
                    <select name="vacancy[place_of_work]" class="sel_small">
                        <? foreach ($placeOfWork as $i => $s) : ?>
                        <option value="<?=$i;?>" <? if ($vacancy['place_of_work'] == $i): echo 'selected'; endif; ?>><?=$s;?></option>
                        <? endforeach;?>
                    </select>
                </div>
                <div class="cl"></div>
            </div>
        </div>
    </div>
    <div class="vacancy_block">
        <div class="vacancy_heading">
            <h3 class="vacancy_title">Оклад</h3>
        </div>
        <div class="vacancy_block_inner">
            <div class="input_wrap fl">
                <div class="sel_label">От</div>
                <input class="input_small" name="vacancy[salary_from]" value="<?=$vacancy['salary_from'];?>" type="text" />
            </div>
            <div class="input_wrap fl">
                <div class="sel_label">до</div>
                <input class="input_small" name="vacancy[salary_to]" value="<?=$vacancy['salary_to'];?>" type="text" />
            </div>
            <div class="sel_label">руб. в месяц</div>
            <div class="checkbox_wrap fr">
                <input id="checkbox_9"  type="checkbox" name="vacancy[salary]" <? if ($vacancy['salary'] == 'on') :?> checked <?endif;?>/>
                <label for="checkbox_9">по договоренности</label>
            </div>
            <div class="cl"></div>
        </div>
    </div>
    <div class="dop-vacancy_block">

    <div class="vacancy_block js-tog"  <? if ($vacancy['experience_from'] > 0 || $vacancy['experience_to'] > 0):?> style="display:block;" <?endif;?>>
    <div class="vacancy_heading">
        <h3 class="vacancy_title">Опыт работы</h3>
        <a class="icon_minus" href="#"></a>
    </div>
    <div class="vacancy_block_inner">
        <h3 class="exp_years">
            ОТ <span class="js-min"> 0 </span>
            ДО <span class="js-max"> 10 </span> ЛЕТ
        </h3>
        <input type="hidden" name="vacancy[experience_from]" value="<?=$vacancy['experience_from'];?>" />
        <input type="hidden" name="vacancy[experience_to]" value="<?=$vacancy['experience_to'];?>" />
        <div class="ovh">
            <div class="experience_line">
                <a href="#" class="js-contols exp_l"></a>
                <a href="#" class="js-contols exp_r"></a>
                <div class="experience_line_inner"></div>
            </div>
            <ul class="exp_numbers">
                <li>1</li>
                <li>2</li>
                <li>3</li>
                <li>4</li>
                <li>5</li>
                <li>6</li>
                <li>7</li>
                <li>8</li>
                <li>9</li>
                <li>10</li>
            </ul>
        </div>
        <div class="cl"></div>
    </div>
</div>


<div class="vacancy_block js-tog" <? if (strlen($vacancy['prava']) > 0):?> style="display:block;" <?endif;?>>
<div class="vacancy_heading">
    <h3 class="vacancy_title">Водительские права</h3>
    <a href="#" class="icon_minus"></a>
</div>
<div class="vacancy_block_inner">
    <div class="checkbox_wrap fl" style="padding-right: 15px;">
        <input id="checkbox_10"  type="checkbox" <? if (strpos($vacancy['prava'],'A') !== false):?> checked <?endif;?> name="vacancy[A]" />
        <label for="checkbox_10">A</label>
    </div>
    <div class="checkbox_wrap fl" style="padding-right: 15px;">
        <input id="checkbox_11"  type="checkbox" <? if (strpos($vacancy['prava'],'B') !== false):?> checked <?endif;?> name="vacancy[B]" />
        <label for="checkbox_11">B</label>
    </div>
    <div class="checkbox_wrap fl" style="padding-right: 15px;">
        <input id="checkbox_12"  type="checkbox" <? if (strpos($vacancy['prava'],'C') !== false):?> checked <?endif;?> name="vacancy[C]" />
        <label for="checkbox_12">C</label>
    </div>
    <div class="checkbox_wrap fl" style="padding-right: 15px;">
        <input id="checkbox_13"  type="checkbox" <? if (strpos($vacancy['prava'],'D') !== false):?> checked <?endif;?> name="vacancy[D]" />
        <label for="checkbox_13">D</label>
    </div>
    <div class="checkbox_wrap fl" style="padding-right: 15px;">
        <input id="checkbox_14"  type="checkbox" <? if (strpos($vacancy['prava'],'E') !== false):?> checked <?endif;?> name="vacancy[E]" />
        <label for="checkbox_14">E</label>
    </div>
    <div class="cl"></div>
</div>
</div>

<div class="vacancy_block js-tog" <? if ($vacancy['education'] > 0):?> style="display:block;" <?endif;?>>
<div class="vacancy_heading">
    <h3 class="vacancy_title">Уровень образования</h3>
    <a href="#" class="icon_minus"></a>
</div>
<div class="vacancy_block_inner">
    <? foreach ($education as $i => $s) : ?>
    <div class="radio_wrap fl" style="padding-right: 15px;">
        <input id="radio_1<?=$i;?>" value="<?=$i;?>"  type="radio" <? if ($vacancy['education'] == $i):?> checked <?endif;?> name="vacancy[education]" />
        <label for="radio_1<?=$i;?>"><?=$s;?></label>
    </div>
    <? endforeach;?>
    <div class="cl"></div>
</div>
</div>

<div class="vacancy_block js-tog js-ino" <? if (is_array(@$vacancy['lang'])):?> style="display:block;" <?endif;?>>
<div class="vacancy_heading">
    <h3 class="vacancy_title">Иностранные языки</h3>
    <a href="#" class="icon_minus"></a>
</div>
<div class="vacancy_block_inner">

    <? if (is_array(@$vacancy['lang'])) : ?>
    <? foreach (@$vacancy['lang'] as $i => $l) : ?>
    <div class="selector_wrap">
        <select name="vacancy[lang][<?=$i;?>][1]" class="sel_small">
            <? foreach ($lang as $j => $s) : ?>
            <option value="<?=$j;?>" <? if ($l[1] == $j): echo 'selected'; endif; ?>><?=$s;?></option>
            <? endforeach;?>
        </select>
        <select name="vacancy[lang][<?=$i;?>][2]" class="sel_small">
            <? foreach ($langType as $j => $s) : ?>
            <option value="<?=$j;?>" <? if ($l[2] == $j): echo 'selected'; endif; ?>><?=$s;?></option>
            <? endforeach;?>
        </select>
        <? if ($i > 1) : ?> <a href="#" class="js-lang_del"></a><?endif;?>
    </div>
    <? endforeach;?>
    <? else : ?>
    <div class="selector_wrap">
        <select name="vacancy[lang][1][1]" class="sel_small">
            <? foreach ($lang as $j => $s) : ?>
            <option value="<?=$j;?>" <? if (@$vacancy['lang'][1][1] == $j): echo 'selected'; endif; ?>><?=$s;?></option>
            <? endforeach;?>
        </select>
        <select name="vacancy[lang][1][2]" class="sel_small">
            <? foreach ($langType as $j => $s) : ?>
            <option value="<?=$j;?>" <? if (@$vacancy['lang'][1][2] == $j): echo 'selected'; endif; ?>><?=$s;?></option>
            <? endforeach;?>
        </select>
    </div>
    <? endif; ?>

    <a href="#" class="js-lang_add">Добавить</a>
    <div class="cl"></div>
</div>
</div>

<div class="vacancy_block js-tog" <? if ($vacancy['sex'] > 0):?> style="display:block;" <?endif;?>>
<div class="vacancy_heading">
    <h3 class="vacancy_title">Пол</h3>
    <a href="#" class="icon_minus"></a>
</div>
<div class="vacancy_block_inner">
    <div class="radio_wrap fl" style="padding-right: 15px;">
        <input id="radio_1" value="1"  type="radio" <? if ($vacancy['sex'] == 1):?> checked <?endif;?> name="vacancy[sex]" />
        <label for="radio_1">мужской</label>
    </div>
    <div class="radio_wrap fl" style="padding-right: 15px;">
        <input id="radio_2" value="2"  type="radio" <? if ($vacancy['sex'] == 2):?> checked <?endif;?> name="vacancy[sex]" />
        <label for="radio_2">женский</label>
    </div>
    <div class="cl"></div>
</div>
</div>

<div class="vacancy_block js-tog" <? if ($vacancy['old_from'] > 0 || $vacancy['old_to'] > 0):?> style="display:block;" <?endif;?>>
<div class="vacancy_heading">
    <h3 class="vacancy_title">Возраст</h3>
    <a href="#" class="icon_minus"></a>
</div>
<div class="vacancy_block_inner">
    <div class="input_wrap fl">
        <div class="sel_label">От</div>
        <input class="input_small" name="vacancy[old_from]" value="<?=$vacancy['old_from'];?>" type="text" />
    </div>
    <div class="input_wrap fl">
        <div class="sel_label">до</div>
        <input class="input_small" name="vacancy[old_to]" value="<?=$vacancy['old_to'];?>" type="text" />
    </div>
    <div class="sel_label">лет</div>
    <div class="cl"></div>
</div>
</div>

<div class="vacancy_block js-tog" <? if ($vacancy['sex_status'] > 0):?> style="display:block;" <?endif;?>>
<div class="vacancy_heading">
    <h3 class="vacancy_title">Семейное положение</h3>
    <a href="#" class="icon_minus"></a>
</div>
<div class="vacancy_block_inner">
    <? foreach ($sexStatus as $i => $s) : ?>
    <div class="radio_wrap fl" style="padding-right: 15px;">
        <input id="radio_2<?=$i;?>" value="<?=$i;?>"  type="radio" <? if ($vacancy['sex_status'] == $i):?> checked <?endif;?> name="vacancy[sex_status]" />
        <label for="radio_2<?=$i;?>"><?=$s;?></label>
    </div>
    <? endforeach;?>
    <div class="cl"></div>
</div>
</div>

<div class="vacancy_block js-tog" <? if ($vacancy['children'] > 0):?> style="display:block;" <?endif;?>>
<div class="vacancy_heading">
    <h3 class="vacancy_title">Дети</h3>
    <a href="#" class="icon_minus"></a>
</div>
<div class="vacancy_block_inner">
    <div class="radio_wrap fl" style="padding-right: 15px;">
        <input id="radio_5" value="1"  type="radio" <? if ($vacancy['children'] == 1):?> checked <?endif;?> name="vacancy[children]" />
        <label for="radio_5">Есть</label>
    </div>
    <div class="radio_wrap fl" style="padding-right: 15px;">
        <input id="radio_6" value="2"  type="radio" <? if ($vacancy['children'] == 2):?> checked <?endif;?> name="vacancy[children]" />
        <label for="radio_6">Нет</label>
    </div>
    <div class="cl"></div>
</div>
</div>

<!---div class="vacancy_block js-tog">
    <div class="vacancy_heading">
        <h3 class="vacancy_title">Метро:</h3>
        <a href="#" class="icon_minus"></a>
    </div>
    <div class="vacancy_block_inner">
        <div class="input_wrap">
            <input type="text" name="vacancy[education]" value="<?=$vacancy['education'];?>">
        </div>
        <div class="cl"></div>
    </div>
</div--->



</div>
<div class="vacancy_block">
    <div class="vacancy_heading">
        <h3 class="vacancy_title">требования к кандидату</h3>
    </div>
    <div class="vacancy_block_inner">
        <!--- todo визивик -->
        <h6 class="vacancy_subtitle">Должностные обязанности</h6>
        <textarea class="mce" name="vacancy[require_responsibility]"><?=$vacancy['require_responsibility'];?></textarea>
        <h6 class="vacancy_subtitle">Требования</h6>
        <textarea class="mce" name="vacancy[require_skills]"><?=$vacancy['require_skills'];?></textarea>
        <h6 class="vacancy_subtitle">Условия работы</h6>
        <textarea class="mce" name="vacancy[require_terms]"><?=$vacancy['require_terms'];?></textarea>
    </div>
</div>
<div class="vacancy_block">
    <div class="vacancy_heading">
        <h3 class="vacancy_title">Контактная информация</h3>
    </div>
    <div class="vacancy_block_inner">
        <div class="contact_info">
            <?=$vacancy['company_name'];?>(<a target="_blank" href="http:\\<?=$vacancy['company_site'];?>"><?=$vacancy['company_site'];?></a>)
            <input class="hide" type="text" name="vacancy[company_name]" value="<?=$vacancy['company_name'];?>" />
            <input class="hide" type="text" name="vacancy[company_site]" value="<?=$vacancy['company_site'];?>" />
            <div class="cl"></div>
            <br />
            <span class="js-notEdit"><?=$vacancy['contact_name'];?> (<?=$vacancy['contact_phone1'];?>, <a href="mailto:<?=$vacancy['contact_email'];?>"><?=$vacancy['contact_email'];?></a>)</span> <a href="#" class="edit_icon fr js-edit-contact"></a>
            <div class="input_wrap">
                <input class="hide js-contact" type="text" name="vacancy[contact_name]" value="<?=$vacancy['contact_name'];?>" />
                <input class="hide js-contact" type="text" name="vacancy[contact_email]" value="<?=$vacancy['contact_email'];?>" />
                <input class="hide js-contact" type="text" name="vacancy[contact_phone1]" value="<?=$vacancy['contact_phone1'];?>" />
                <input class="hide js-contact" type="text" name="vacancy[contact_phone2]" value="<?=$vacancy['contact_phone2'];?>" />
            </div>
            <div class="cl"></div>
            <br />
        </div>
        <h6 class="vacancy_subtitle">Рабочий адрес</h6>
        <br />
        <div class="input_wrap">
            <input type="text" name="vacancy[address]" value="<?=$vacancy['address'];?>" />
        </div>
    </div>
    <br />
    <div class="aligncenter">
        <a href="#" onclick="$(this).parents('form').submit(); return false;" class="button">Разместить вакансию</a>
    </div>
    <br />
    <br />
</div>
</div>
<input type="hidden" name="save" value="1">
<input type="hidden" name="vacancy[id]" value="<?=$vacancy['id'];?>">
<input type="hidden" name="vacancy[id_user]" value="<?=$vacancy['id_user'];?>">
<input type="hidden" name="vacancy[id_company]" value="<?=$vacancy['id_company'];?>">
<input type="hidden" name="vacancy[id_url]" value="<?=$vacancy['id_url'];?>">
<input type="hidden" name="vacancy[status]" value="<?=$vacancy['status'];?>">
<input type="hidden" name="vacancy[status_text]" value="<?=$vacancy['status_text'];?>">
<input type="hidden" name="vacancy[date_edit]" value="<?=$vacancy['date_edit'];?>">
</form>
<?
if (@$vacancy['experience_from'] != 0) {
    $start = @$vacancy['experience_from'];
} else {
    $start = 1;
}
if (@$vacancy['experience_to'] != 0) {
    $end = @$vacancy['experience_to'];
} else {
    $end = 10;
}
?>
<script type="text/javascript">
    tinymce.init({
        selector: "textarea.mce",
        plugins: [
            "advlist autolink lists charmap print preview anchor",
            "searchreplace visualblocks code fullscreen",
            "insertdatetime media table contextmenu paste moxiemanager"
        ],
        menubar: false
    });
    $('.js-edit-contact').click(function(){
        $(this).addClass('hide').prev('.js-notEdit').addClass('hide');
        $('.js-contact').removeClass('hide');
        return false;
    });
    $('[name="vacancy[salary]"]').click(function(){
        if ($(this).is(':checked')) {
            $(this).parent().parent().find('input[type="text"]').attr('disabled','disabled');
        } else {
            $(this).parent().parent().find('input[type="text"]').removeAttr('disabled');
        }
    });
    $(document).ready(function(){
        movePriceSelVacancy(<?=$start.','.$end;?>);

        var city = $('[name="vacancy[city]"]'),
                profession = $('[name="vacancy[profession]"]'),
                speciality = $('[name="vacancy[speciality]"]'),
                salary_from = $('[name="vacancy[salary_from]"]'),
                salary_to = $('[name="vacancy[salary_to]"]'),
                salary = $('[name="vacancy[salary]"]'),
                old_from = $('[name="vacancy[old_from]"]'),
                old_to = $('[name="vacancy[old_to]"]'),
                address = $('[name="vacancy[address]"]'),
                contact_name = $('[name="vacancy[contact_name]"]'),
                contact_email = $('[name="vacancy[contact_email]"]'),
                contact_phone1 = $('[name="vacancy[contact_phone1]"]'),
                contact_phone2 = $('[name="vacancy[contact_phone2]"]');
        if (salary_from.val() == '') salary_from.val('0');
        if (salary_to.val() == '') salary_to.val('0');
        if (old_from.val() == '') old_from.val('0');
        if (old_to.val() == '') old_to.val('0');
        if (salary.is(':checked')) {
            salary_from.attr('disabled','disabled');
            salary_to.attr('disabled','disabled');
        }
        beKladr(1,city);
        makeMask(1,salary_from);
        makeMask(1,salary_to);
        makeMask(1,old_from);
        makeMask(1,old_to);
        makeMask(5,profession);
        makeMask(5,address);
        makeMask(5,contact_name);
        makeMask(3,contact_email);
        makeMask(7,contact_phone1);
        makeMask(7,contact_phone2);
        profession.keyup(function() {errorCheck(1,profession,2)});
        city.keyup(function() {errorCheck(4,city)});
        contact_name.keyup(function() {errorCheck(1,contact_name,2)});
        $('form.vacancy_form').submit(function() {
            var error = errorCheck(1,profession,2) + errorCheck(1,speciality,2) + errorCheck(4,city) + errorCheck(1,salary_from) + errorCheck(1,salary_to) + errorCheck(1,old_from) + errorCheck(1, old_to);
            if (error == 0) {
                $('.js-tog:not(:visible)').remove();
                return true;
            } else {
                return false;
            }
        })
    })
</script>

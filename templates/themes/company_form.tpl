<form action="" method="post" class="reg_form">
    <label>Название:</label>
    <div class="input_wrap">
        <select name="type" class="reg_firm_sel">
            <option value="1" <? if (@$company['type'] == 1): ?>selected<?endif;?>>ООО</option>
            <option value="2" <? if (@$company['type'] == 2): ?>selected<?endif;?>>ОАО</option>
            <option value="3" <? if (@$company['type'] == 3): ?>selected<?endif;?>>ЗАО</option>
            <option value="4" <? if (@$company['type'] == 4): ?>selected<?endif;?>>ИП</option>
        </select>
        <input name="name" class="reg_firm_inp" type="text" value="<?=doBest(@$company['name']);?>" />
    </div>
    <div class="cl"></div>
    <label>Деятельность компании::</label>
    <div class="input_wrap">
        <textarea name="text" ><?=@$company['text'];?></textarea>
        <span class="descr">Можете указать общее направление, оказываемые услуги, производимые или продаваемые товары</span>
    </div>
    <div class="cl"></div>
    <label>Город:</label>
    <div class="input_wrap">
        <input type="text" name="city" value="<?=@$company['city'];?>" class="kladrCity" />
        <span class="descr">Например, Москва или Санкт-Петербург</span>
    </div>
    <div class="cl"></div>
    <label>Адрес:</label>
    <div class="input_wrap">
        <input type="text" name="address" value="<?=@$company['address'];?>" class="" />
        <span class="descr"></span>
    </div>
    <div class="cl"></div>
    <label>Сайт компании:</label>
    <div class="input_wrap">
        <input type="text" name="site" value="<?=@$company['site'];?>" />
    </div>
    <div class="cl"></div>
    <label>Размер компании:</label>
    <div class="input_wrap">
        <select name="size" class="">
            <option value="1" <? if (@$company['size'] == 1): ?>selected<?endif;?>>До 50 человек</option>
            <option value="2" <? if (@$company['size'] == 2): ?>selected<?endif;?>>До 100 человек</option>
            <option value="3" <? if (@$company['size'] == 3): ?>selected<?endif;?>>От 100 человек</option>
        </select>
    </div>
    <div class="cl"></div>
    <label>Ваша должность:</label>
    <div class="input_wrap">
        <input type="text" name="post"   value="<?=@$company['post'];?>" />
    </div>
    <div class="cl"></div>
    <label>E-mail адрес:</label>
    <div class="input_wrap">
        <input type="text" name="email"  value="<?=@$company['email'];?>"  />
    </div>
    <div class="cl"></div>
    <br />
    <input type="hidden" name="save" value="1" />
    <input type="hidden" name="id" value="<?=@$company['id'];?>" />
    <div class="aligncenter">
        <a href="#" onclick="$(this).parents('form').submit(); return false;" class="button"><?=$buttonText;?></a>
    </div>
</form>
<script type="text/javascript">
    $(document).ready(function() {
        var     name = $('[name="name"]'),
                text = $('[name="text"]'),
                city = $('[name="city"]'),
                site = $('[name="site"]'),
                post = $('[name="post"]'),
                email = $('[name="email"]');
        makeMask(3,email);
        makeMask(5,name);
        makeMask(5,post);
        makeMask(5,text);
        makeMask(3,site);
        name.keyup(function() {errorCheck(1,name,2)});
        post.keyup(function() {errorCheck(1,post,2)});
        email.keyup(function() {errorCheck(3,email)});
        city.keyup(function() {errorCheck(4,city)});
        //        КЛАДР
        beKladr(1,city);

        $('form.reg_form').submit(function() {
            var error = errorCheck(1,name,2) + errorCheck(1,post,2) + errorCheck(3,email) + errorCheck(4,city);
            return (error == 0);
        })
    })
</script>
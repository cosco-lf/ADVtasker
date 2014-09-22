<? if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();?>
<? if (sizeof($arResult['ITEMS']) > 0):?>
<script type="text/javascript">
    <? if ($_SERVER["REQUEST_URI"] == "/about/branches/moskovskaya-oblast/?clear_cache=Y" || $_SERVER["REQUEST_URI"] == "/about/branches/moskovskaya-oblast/")  $arResult['ZOOM'] = 13; ?>
    zoom = <?=$arResult['ZOOM'];?>;
    <? foreach ($arResult['ITEMS'] as $arItem):?>
    arPlaces[<?=$arItem['ID'];?>] = {
        "name":"<?=$arItem['TYPE'];?> «<?=$arItem['NAME'];?>»",
        "address": "<?=$arItem['ZIP'];?>, <?=$arItem['ADDRESS'];?>",
        "phone": "<?=$arItem['PHONE'];?>",
        "search":"<?=$arItem['NAME'];?> <?=$arItem['ZIP'];?> <?=$arItem['ADDRESS'];?>",
        "latitude":"<?=$arItem['LATITUDE'];?>",
        "longitude": "<?=$arItem['LONGITUDE'];?>"
    };
    <? endforeach;?>
</script>
<div class="tabsBlockWrapper">
<ul class="tabs viewType fw">
    <li>
        <a href="#" class="active"><i class="l"></i>Списком<i class="r"></i></a>
    </li>
    <li class="last">
        <a href="#"><i class="l"></i>На карте<i class="r"></i></a>
    </li>
</ul>
<div class="tabsBlock">
    <div class="tabsContent wide">

        <div class="borderBlock wide">
            <i class="t"></i>
            <i class="r"></i>
            <i class="b"></i>
            <i class="l"></i>
            <div class="searchInner">
                <span class="title">Искать по названию</span>
                <fieldset>
                    <form action="">
                        <input type="text" class="textbox" /><input type="submit" value="" class="btnFind" />
                        <p class="hint noIndent">
                            В качестве запроса подойдет название офиса,часть адреса или индекс.
                        </p>
                        <p class="error search hide">
                            К сожалению, ничего не найдено. Возможно, вы допустили ошибку в написании, или ООО “Внешпромбанк”
                            <br/>
                            еще не открыл представительство в данном месте. Попробуйте расширить круг поиска или воспользуйтесь <a href="/sitemap/" class="color-type1">картой сайта</a>
                        </p>
                    </form>
                </fieldset>
            </div>
        </div>

        <div class="officeDescribe">
            <? foreach ($arResult['ITEMS'] as $arItem):?>
            <div class="borderBlock wide" id="js-item-<?=$arItem['ID'];?>">
                <i class="t"></i>
                <i class="r"></i>
                <i class="b"></i>
                <i class="l"></i>
                <div class="data_wrapper">
                    <div class="imgWrapper">
                        <? if ($arItem['IMG']):?>
                        <img src="<?=$arItem['IMG'];?>" />
                        <? endif;?>
                    </div>
                    <div class="describe fw">
                        <div class="data">
                            <h3 id="js-search-name">
                                <? if ($arItem['TYPE'] == "Филиал") :?>
                                <?=$arItem['NAME'];?> филиал ООО «Внешпромбанк»
                                <? else :?>
                                <?=$arItem['TYPE'];?> «<?=$arItem['NAME'];?>»
                                <? endif;?>
                            </h3>
                            <p class="font5" id="js-search-address">
                                <?=$arItem['ZIP'];?>, <a href="#" class="color-type1"><?=$arItem['ADDRESS'];?></a>
                            </p>
                            <? foreach ($arItem['METRO'] as $metro):?>
                            <?=$metro;?>
                            <? endforeach;?>
                            <ul>
                                <? if ($arItem['PHONE']):?>
                                <li>
                                    Тел.: <?=$arItem['PHONE'];?>
                                </li>
                                <? endif;?>
                                <? if ($arItem['FAX']):?>
                                <li>
                                    Факс: <?=$arItem['FAX'];?>
                                </li>

                                <? endif;?>
                            </ul>
                            <? if ($arItem['BANKOMAT']):?>

                            <br/>
                            <img src="/img/markerSmall.png" style="float:left; position:relative; top:-8px;"/><b><?=$arItem['BANKOMAT'];?></b>
                            <? endif;?>
                        </div>
                    </div>
                    <div style="clear:both;margin:10px 0px;"></div>

                    <div class="imgWrapper">

                        <? if (strlen($arItem['BOSS_PHOTO']) && strlen($arItem['BOSS'])):?>
                        <a href="<?=$arItem['BOSS_PHOTO'];?>" data-lightbox="boss_gallery"><img src="<?=$arItem['BOSS_PHOTO'];?>" class="boss_photo" /></a>
                        <? endif;?>

                    </div>
                    <div class="describe fw">
                        <div class="data">
                            <ul>
                                <? if (strlen($arItem['BOSS_POS']) && strlen($arItem['BOSS'])):?>
                                <li><?=$arItem['BOSS_POS'];?>: <strong><?=$arItem['BOSS'];?></strong></li>
                                <? endif;?>

                                <? if (strlen($arItem['BUH_POS']) && strlen($arItem['BUH'])):?>
                                <li><?=$arItem['BUH_POS'];?>: <strong><?=$arItem['BUH'];?></strong></li>
                                <? endif;?>
                            </ul>

                            <? if ($arItem['CONTROL']):?>
                            <div class="hidedBlock hide">
                                <p class="noIndent">
                                    <strong>Реквизиты учреждений Банка России, осуществляющих надзор <br/>за деятельностью ООО "Внешпромбанк":
                                    </strong>
                                    <br/>
                                    <?=$arItem['CONTROL'];?>
                                </p>
                            </div>
                            <a href="#" class="showAll down color-type1"><span class="pseudo">Подробная информация</span></a>
                            <? endif;?>
                        </div>
                    </div>

                </div>
                <div class="workTime">
                    <? if (sizeof($arItem['WORK_TIME'])):?>
                    <h3>Режим работы</h3>
                    <ul>
                        <? foreach ($arItem['WORK_TIME'] as $time):?>
                        <li>
                            <?=$time;?>
                        </li>
                        <? endforeach;?>
                    </ul>
                    <? endif;?>

                    <? if ($arItem['PERERIV']):?>
                    <ul>
                        <li>
                            Технический перерыв
                        </li>
                        <li>
                            <?=$arItem['PERERIV'];?>
                        </li>
                    </ul>
                    <? endif;?>

                    <? if (sizeof($arItem['UR_TIME']) && strlen($arItem['UR_TIME'][0]) > 0):?>
                    <ul class="noIndent">
                        <li>
                            Время обслуживания юр. лиц.:
                        </li>
                        <? foreach ($arItem['UR_TIME'] as $time):?>
                        <li>
                            <?=$time;?>
                        </li>
                        <? endforeach;?>
                    </ul>
                    <? endif;?>


                </div>
            </div>
            <? endforeach;?>
        </div>

    </div>

    <div class="tabsBlock" style="display: none">
        <div class="tabsContent wide">
            <div class="mapWrapper">
                <div class="borderBlock wide" style="z-index: 10000">
                    <i class="t"></i>
                    <i class="r"></i>
                    <i class="b"></i>
                    <i class="l"></i>
                    <div class="searchInner">
                        <span class="title">Искать по названию</span>
                        <fieldset>
                            <form action="">
                                <input type="text" class="textbox" /><input type="submit" value="" class="btnFind" />
                                <p class="hint noIndent">
                                    В качестве запроса подойдет название офиса,часть адреса или индекс.
                                </p>
                                <p class="error search hide">
                                    К сожалению, ничего не найдено. Возможно, вы допустили ошибку в написании, или ООО “Внешпромбанк”
                                    <br/>
                                    еще не открыл представительство в данном месте. Попробуйте расширить круг поиска или воспользуйтесь <a href="#" class="color-type1">картой сайта</a>
                                </p>
                            </form>
                        </fieldset>
                    </div>
                </div>
                <div class="map">
                    <i class="t"></i>
                    <i class="r"></i>
                    <i class="b"></i>
                    <i class="l"></i>
                    <div id="yandexMap" style="width:984px; height: 500px"></div>
                </div>
            </div>
        </div>
    </div>

</div>
<? endif;?>


<? if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();?>
<? if (sizeof($arResult['ITEMS']) > 0):?>
<script type="text/javascript">
    zoom = <?=$arResult['ZOOM'];?>;
    <? foreach ($arResult['ITEMS'] as $arItem):?>
    arPlaces[<?=$arItem['ID'];?>] = {
        "name":"<?=$arItem['NAME'];?>",
        "company": "<?=$arItem['COMPANY'];?>",
        "everytime": "<?=$arItem['EVERYTIME'];?>",
        "search":"<?=$arItem['NAME'];?> <?=$arItem['COMPANY'];?>",
        "latitude":"<?=$arItem['LATITUDE'];?>",
        "longitude": "<?=$arItem['LONGITUDE'];?>"
    };
    <? endforeach;?>
</script>
<div class="tabsBlockWrapper">
    <ul class="tabs viewType fw">
        <li>
            <a href="#" class="active"><i class="l"></i>Списком<i class="r"></i></a>
        </li>
        <li class="last">
            <a href="#"><i class="l"></i>На карте<i class="r"></i></a>
        </li>
    </ul>
    <div class="tabsBlock">
        <div class="tabsContent wide">

            <div class="borderBlock wide">
                <i class="t"></i>
                <i class="r"></i>
                <i class="b"></i>
                <i class="l"></i>
                <div class="searchInner">
                    <span class="title">Искать по названию</span>
                    <fieldset>
                        <form action="">
                            <input type="text" class="textbox" /><input type="submit" value="" class="btnFind" />
                            <p class="hint noIndent">
                                В качестве запроса подойдет часть адреса или место расположения.
                            </p>
                            <p class="error search hide">
                                К сожалению, ничего не найдено. Возможно, вы допустили ошибку в написании, или ООО “Внешпромбанк”
                                <br/>
                                еще не открыл представительство в данном месте. Попробуйте расширить круг поиска или воспользуйтесь <a href="/sitemap/" class="color-type1">картой сайта</a>
                            </p>
                        </form>
                    </fieldset>
                </div>
            </div>

            <div class="atmFiltr">
                <input type="checkbox" name="" id="c1" class="checkbox" />
                <label for="c1">Только банкоматы, работающие круглосуточно</label>
            </div>

            <div class="tableBorderBlock atmTable">
                <? foreach ($arResult['ITEMS'] as $i => $arItem):?>
                <div class="borderBlock wide<?=($i % 2 == 1 ? ' noFill' : '');?>" id="js-item-<?=$arItem['ID'];?>">
                    <i class="t"></i>
                    <i class="r"></i>
                    <i class="b"></i>
                    <i class="l"></i>
                    <div class="td td1">
                        <a href="#" class="color-type1"><?=$arItem['NAME'];?></a>
                        <? if ($arItem['COMPANY']):?>
                        <p class="color-type3">
                            <?=$arItem['COMPANY'];?>
                        </p>
                        <? endif;?>
                    </div>
                    <div class="td td2">
                        <? foreach ($arItem['METRO'] as $metro):?>
                        <?=$metro;?>
                        <? endforeach;?>
                        &nbsp;
                    </div>
                    <div class="td td3">
                        <? if ($arItem['EVERYTIME'] == 'Y'):?>
                        <span class="color-type3">Круглосуточно</span>
                        <? else:?>
                        <span class="color-type3"><?=$arItem['WORK_TIME'];?></span>
                        <? endif;?>
                        &nbsp;
                    </div>
                    <div class="td td4">
                        <ul>
                            <? if ($arItem['CASHOUT']):?>
                            <li>
                                Выдача: <span class="color-type3"><?=$arItem['CASHOUT'];?></span>
                            </li>
                            <? endif;?>
                            <? if ($arItem['CASHIN']):?>
                            <li>
                                Прием:<span class="color-type3"> <?=$arItem['CASHIN'];?></span>
                            </li>
                            <? endif;?>
                        </ul>
                    </div>
                    <div class="td td5">
                        <ul>
                            <? if ($arItem['ACCESS']):?>
                            <li>
                                <?=GetMessage("ACCESS");?><span class="color-type3"><?=$arItem['ACCESS'];?></span>
                            </li>
                            <? endif;?>
                        </ul>
                    </div>

                </div>
                <? endforeach;?>
            </div>

        </div>
    </div>

    <div class="tabsBlock" style="display: none">
        <div class="tabsContent wide">
            <div class="mapWrapper">
                <div class="borderBlock wide" style="z-index: 10000">
                    <i class="t"></i>
                    <i class="r"></i>
                    <i class="b"></i>
                    <i class="l"></i>
                    <div class="searchInner">
                        <span class="title">Искать по названию</span>
                        <fieldset>
                            <form action="">
                                <input type="text" class="textbox" /><input type="submit" value="" class="btnFind" />
                                <p class="hint noIndent">
                                    В качестве запроса подойдет часть адреса или место расположения.
                                </p>
                                <p class="error search hide">
                                    К сожалению, ничего не найдено. Возможно, вы допустили ошибку в написании, или ООО “Внешпромбанк”
                                    <br/>
                                    еще не открыл представительство в данном месте. Попробуйте расширить круг поиска или воспользуйтесь <a href="#" class="color-type1">картой сайта</a>
                                </p>
                            </form>
                        </fieldset>
                    </div>
                </div>
                <div class="map">
                    <i class="t"></i>
                    <i class="r"></i>
                    <i class="b"></i>
                    <i class="l"></i>
                    <div id="yandexMap" style="width:984px; height: 500px"></div>
                </div>
            </div>
        </div>
    </div>


</div>
<? endif;?>
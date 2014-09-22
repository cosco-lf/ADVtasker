<? if ($isLogin): ?>

  <? if ($isAdmin): ?>
  <? include 'blocks/menu-admin.tpl'; ?>
  <? else: ?>
  <? include 'blocks/menu-user.tpl'; ?>
  <? endif; ?>

<div class="wrapper">

  <div class="container container_map">
    <div class="scroll-field"></div>

    <div class="field field_map">
      <div class="field__wrap">
        <div class="scroll-pane">
          <div class="wrap wrap_mod wrap_partners">
            <div class="partners">
              <div class="partners__top">Партнеры в аэропорту Leonardo Da Vinci <br>International Airport (FCO):</div>
              <div class="partners__item partners__item_grey">
                <div class="partners__col"><i class="ico ico_yahoo"></i></div>
                <div class="partners__col">
                  <div class="partners__name">Yahoo Inc.</div>
                  <div class="partners__phone">+372 888 778 787</div>
                  <a href="mailto:info@yahoo.com" class="partners__mail">info@yahoo.com</a>
                </div>
              </div>
              <div class="partners__item">
                <div class="partners__col"><i class="ico ico_yandex"></i></div>
                <div class="partners__col">
                  <div class="partners__name">Yandex LTD</div>
                  <div class="partners__phone">+1 44 099343982</div>
                  <a href="mailto:info@yandex.ru" class="partners__mail">info@yandex.ru</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>

<div class="google-map">
  <div id="map-canvas" class="google-map__in"></div>
</div>

<script type="text/javascript">
    function initialize() {
        var mapOptions = {
            zoom: 4,
            center: new google.maps.LatLng(41.804444, 12.250833),
            disableDefaultUI: true,
            scrollwheel: false,
            zoomControl: true,
            zoomControlOptions: {
                style: google.maps.ZoomControlStyle.DEFAULT,
                position: google.maps.ControlPosition.LEFT_CENTER
            },
            mapTypeId: google.maps.MapTypeId.ROADMAP,

        }
        var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        var image = '/img/icons/marker.png';
        <? foreach ($air as $a) :?>
        <?if ($a['latitude'] != '-' && $a['longitude'] != '-' && $i<2) :?>
        var myLatLng<?=$i;?> = new google.maps.LatLng(<?=$a['latitude'];?>, <?=$a['longitude'];?>);
        var marker<?=$i;?> = new google.maps.Marker({
            position: myLatLng<?=$i;?>,
            map: map,
            title: '<?=$a['name_ru'];?>',
            icon: image
        });
        var contentString<?=$i;?> =    '<div class="google-map__window">'
                +'<div class="google-map__block"><i></i><p>' + '<?=$a['name_ru'];?>' + '</p></div>';


        var infowindow<?=$i;?> = new google.maps.InfoWindow({
            content: contentString<?=$i;?>
        });
    <?$i++;?>
    <?endif;?>
    <?endforeach;?>

        //infowindow1.open(map,marker1);
//        infowindow2.open(map,marker2);

    }
    // Asynchronous Loading
    function loadScript() {
        var script = document.createElement('script');
        script.type = 'text/javascript';
        script.src = 'http://maps.googleapis.com/maps/api/js?sensor=false&language=ru&' +
                'callback=initialize';
        document.body.appendChild(script);
    }
    window.onload = loadScript;
</script>

<? else: ?>

  <? include 'templates/themes/standart_auth.tpl' ?>

<? endif; ?>
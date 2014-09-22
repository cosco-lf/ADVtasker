$(function() {

  if ($('.google-map').length) {
    $('.out').addClass('out_hidden');
  }

	// $(document).on("click", function(){
	// 	$(".js-popup").hide();
	// });

	//click
	$(document).click(function() {
        $(".js-select-list").hide();
        $(".js-select").removeClass("is-active");
        $(".js-popup").slideUp();
        $(".js-log-in-form").slideUp();
        $(".js-log").removeClass("is-active");
    });

    //selectList
    function selectList() {
        var select = $(".js-select");
        var select_list = $(".js-select-list");
        $("body").on("click", ".js-select", function(event){
            if ($(this).hasClass("is-active")) {
                select.removeClass("is-active");
                select_list.hide();
            }
            else {
                select.removeClass("is-active");
                select_list.hide();
                $(this).find(".js-select-list").show();
                $(this).addClass("is-active");
            }
            event.stopPropagation();
        });
        $("body").on("click", ".js-select-list li", function(event){
            var id = $(this).attr("data-id");
            var text = $(this).text();
            $(this).parents(".js-select").find(".js-select-text").text(text);
            $(this).parents(".js-select").find(".js-select-input").val(id);
            $(this).parent().hide();
            $(this).parents(".js-select").removeClass("is-active");
            event.stopPropagation();
        });
    }  
    selectList();
    $("body").on("click", ".js-select", function(event){
        event.stopPropagation();
    });

    $('.js-log').click(function(){
    	var js_form = $('.js-log-in-form');
    	if ($(this).hasClass("is-active")) {
    	    $(this).parents('form').submit();
    	}
    	else {
    	    $(this).removeClass("is-active");
    	    js_form.slideUp();
    	    js_form.slideDown();
    	    $(this).addClass("is-active");
    	}
        return false;
    });

  if (window.location.search == '?action=login' && $('.js-log').length) {
    $('.js-log').trigger('click');
  }

    //datepicker
    $( "#datepicker, #datepicker2" ).datepicker({
        showOn: "both",
        buttonImage: "/img/calendar.png",
        buttonImageOnly: false,
        dateFormat: "mm.dd.yy"
    });

    $(".js-edit, .js-close").click(function() {
      $('.js-popup').slideToggle();
      return false;
    });

    $("body").on("click", ".js-popup, .js-log-in-form", function(event){
        event.stopPropagation();
    });

    $('.js-form').on('click', '.js-close-row', function(){
        $(this).parent().remove();
        return false;
    });

    $('.js-addrow').on("click", function(){
        var template = $('.js-template-row').html();
        $(this).before(template);
        return false;
    });

});
	//scrollPane
	$('.scroll-pane').jScrollPane({
		hideFocus: true
	});

$(function() {

  if ($('.js-form-submit').length) {

    $('.js-form-submit').click(function() {

      var form = $(this).parents('form'),
          errors = 0;

      form.find('[data-required]').each(function() {
        var $this = $(this);
        if ($this.val() == '') {
          errors++;
          $this.css('border-color', '#f00');
        } else $this.css('border-color', '#c7c7c7');
      });

      form.find('[data-email]').each(function() {
        var $this = $(this),
            r = /^(.*)@(.*)\.\w{2,4}$/i;
        if (!r.test($this.val())) {
          errors++;
          $this.css('border-color', '#f00');
        } else $this.css('border-color', '#c7c7c7');
      });

      form.find('[data-password]').each(function() {
        var $this = $(this),
          p = $this.data('password'),
          password;
        if ($this.val() != '') {
          if (p == 1) password = $('[data-password="2"]');
          else password = $('[data-password="1"]');
          if ($this.val() != password.val()) {
            errors++;
            $this.css('border-color', '#f00');
          } else $this.css('border-color', '#c7c7c7');
        }
      });

      form.find('[data-date]').each(function() {
        var $this = $(this),
          r = /^(.{2}).(.{2}).(.{4})$/i;
        if (!r.test($this.val())) {
          errors++;
          $this.css('border-color', '#f00');
        } else $this.css('border-color', '#c7c7c7');
      });

        if (form.find('.range_block:visible').length <= 0 ) {
            form.find('.range_block').remove();
        }
        if (form.find('.simple:visible').length <= 0 ) {
            form.find('.simple').remove();
        }

      if (errors != 0) return false;

    });
      $('[name="formula[type]"]').click(function() {
          if ($(this).attr('id')=='radio_1') {
              $('.simple').show();
              $('.range_block').hide();
              $('.notChoose').hide();
          } else {
              $('.simple').hide();
              $('.range_block').show();
              $('.notChoose').hide();
          }
      });
      $('.range_wrap').last().find('input:eq(1)').attr('disabled','disabled').css('background-color','#cecece');
      $('.range_wrap').first().find('input:eq(0)').attr('disabled','disabled').css('background-color','#cecece');
      $('.range_wrap').last().find('.js-range_del').remove();
      $('.range_wrap').first().find('.js-range_del').remove();
      $('.js-range_add').click(function() {
          var clone = $(this).prev().clone(),
              tmp = $(this).prev().find('input').first().attr('name'),
              ind = tmp.split('[')[2];
          ind = parseInt(ind.split(']')[0])+1;
          $(this).prev().find('input').removeAttr('disabled').css('background-color','#fff');

          $(this).before(clone);
          $(this).prev().find('input:eq(0)').first().attr('name','formula[from][' + ind + ']');
          $(this).prev().find('input:eq(1)').last().attr('name','formula[to][' + ind + ']');
          $(this).prev().find('input:eq(2)').last().attr('name','formula[percent][' + ind + ']');
          $('.range_wrap').each(function(){
              if ($(this).find('.js-range_del').length > 0) {
              } else {
                  $(this).append('<a href="#" class="edit_delete js-range_del fr"></a>');
              }
          });
          $('.range_wrap').last().find('input:eq(1)').attr('disabled','disabled').css('background-color','#cecece').val('');
          $('.range_wrap').first().find('input:eq(0)').attr('disabled','disabled').css('background-color','#cecece').val('');
          $('.range_wrap').last().find('.js-range_del').remove();
          $('.range_wrap').first().find('.js-range_del').remove();
          return false;
      });
      $('.range_block').on('click','.js-range_del',function(){
          $(this).parent().remove();
          $('.range_wrap').last().find('input:eq(1)').attr('disabled','disabled').css('background-color','#cecece').val('');
          $('.range_wrap').first().find('input:eq(0)').attr('disabled','disabled').css('background-color','#cecece').val('');
          return false;
      });

  }

});

//function initialize() {
//  var mapOptions = {
//    zoom: 12,
//    center: new google.maps.LatLng(41.804444, 12.250833),
//    disableDefaultUI: true,
//    scrollwheel: false,
//    zoomControl: true,
//    zoomControlOptions: {
//      style: google.maps.ZoomControlStyle.DEFAULT,
//      position: google.maps.ControlPosition.LEFT_CENTER
//    },
//    mapTypeId: google.maps.MapTypeId.ROADMAP,
//
//  }
//  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
//  var image = '/img/icons/marker.png';
//  var myLatLng1 = new google.maps.LatLng(50.345001, 30.894722);
//  var myLatLng2 = new google.maps.LatLng(41.804444, 12.250833);
//  var marker1 = new google.maps.Marker({
//    position: myLatLng1,
//    map: map,
//    title: '�������� ���� ���������',
//    icon: image
//  });
//  var marker2 = new google.maps.Marker({
//    position: myLatLng2,
//    map: map,
//    title: 'Leonardo Da Vinci International Airport (FCO)�',
//    icon: image
//  });
//  var contentString1 =    '<div class="google-map__window">'
//    +'<div class="google-map__block"><i></i><p>�������� ���� ���������</p></div>';
//
//  var contentString2 =    '<div class="google-map__window">'
//    +'<div class="google-map__block"><i></i><p>Leonardo Da Vinci International Airport (FCO)</p></div>';
//
//  var infowindow1 = new google.maps.InfoWindow({
//    content: contentString1
//  });
//  var infowindow2 = new google.maps.InfoWindow({
//    content: contentString2
//  });
//  //infowindow1.open(map,marker1);
//  infowindow2.open(map,marker2);
//
//}
//// Asynchronous Loading
//function loadScript() {
//  var script = document.createElement('script');
//  script.type = 'text/javascript';
//  script.src = 'http://maps.googleapis.com/maps/api/js?sensor=false&language=ru&' +
//    'callback=initialize';
//  document.body.appendChild(script);
//}
//window.onload = loadScript;

$(function() {

  if ($('.js-spends').length) {
    $('.js-spends').click(function() {
      var clientNumber = $(this).parents('form').find('[name=client]'),
          error = 0;
      $.ajax({
        url: '/',
        type: 'post',
        cache: false,
        async: false,
        data: {
          ajax: true,
          checkExistClient: clientNumber.val()
        },
        success: function(response) {
          if (response == 'false') {
            clientNumber.css('border-color', "#f00");
            alert(clientNumberNotFound);
            error++;
          } else clientNumber.css('border-color', "#c7c7c7");
        }
      });
      if (error != 0) return false;
    });
  }

  if ($('.js-spends-delete')) {
    $('.js-spends-delete').click(function() {
      if (confirm('Delete?')) {
        var url = "/admin/spends/delete/",
          method = "post",
          id = $(this).siblings('[name="id"]'),
          save = $(this).siblings('[name="save"]');
        var $form = $('<form></form>');
        $form.attr('method', method).attr('action', url);
        $form.append(id).append(save);
        $('body').append($form);
        $form.submit();
        return false;
      }
    });
  }

  if ($('.js-spends-partner-delete')) {
    $('.js-spends-partner-delete').click(function() {
      if (confirm('Delete?')) {
        var url = "/my/delete/",
          method = "post",
          id = $(this).siblings('[name="id"]'),
          save = $(this).siblings('[name="save"]');
        var $form = $('<form></form>');
        $form.attr('method', method).attr('action', url);
        $form.append(id).append(save);
        $('body').append($form);
        $form.submit();
        return false;
      }
    });
  }

  if ($('.js-spends-change').length) {
    $('.js-spends-change').click(function() {
      var tr = $(this).parents('tr'),
          popup = $('.js-popup');
      popup.find('[name=date]').val(tr.find('td:eq(0)').text());
      popup.find('[name=client]').val(tr.find('td:eq(1)').text());
      popup.find('[name=summa]').val(tr.find('td:eq(2)').text());
      popup.find('[name=id]').val(tr.find('input[name=id]').val());
    });
  }

  if ($('.js-fast-create').length) {
    $('.js-fast-create').click(function(){
      var name = $(this).attr('data-name');
      $(this).siblings('span').remove();
      $(this).before('<div class="input"><div class="input__row"><input type="text" name="'+name+'"></div></div>');
      $(this).remove();
    });
  }

  if ($('.js-fast-edit').length) {
    $('.js-fast-edit').click(function(){
      var id = $(this).find('span').attr('data-name'),
        text = $(this).find('span').text();
      $(this).before('<div class="input"><div class="input__row"><input type="text" name="langWord['+id+']" value="'+text+'"/></div></div>');
      $(this).remove();
    });
  }

  if ($('.js-save').length) {
    $('.js-save').click(function() {
      var form = $(this).data('form');
      $('#' + form).submit();
      return false;
    });
  }

  if ($('.scroll-pane').length) {
    if (!$('.scroll-pane').hasClass('jspScrollable')) $('.wrap').addClass('no-scroll')
  }

});
$(document).ready(function(){
    $('.js-del-button').click(function(){
        if (confirm("Удалить?")) {
            var $form = $('<form></form>');
            $form.attr('method','post').attr('action',$(this).data('url'))
            $form.append('<input type="hidden" value="1" name="save"/>');
            $form.append('<input type="hidden" value="' + $(this).data('del-id') + '" name="del"/>');
            $('body').append($form);
            $form.submit();
        }
        return false;
    });
});
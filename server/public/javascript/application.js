$.jQTouch({
    icon: '/images/icon.png',
    statusBar: 'black-translucent',
    preloadImages: [
      '/stylesheets/jqt/img/back_button_clicked.png',
      '/stylesheets/jqt/img/back_button.gif',
      '/stylesheets/jqt/img/button_clicked.png',
      '/stylesheets/jqt/img/button.png',
      '/stylesheets/jqt/img/chevron_circle.png',
      '/stylesheets/jqt/img/chevron.gif',
      '/stylesheets/jqt/img/grayButton.png',
      '/stylesheets/jqt/img/loading.png',
      '/stylesheets/jqt/img/on_off.png',
      '/stylesheets/jqt/img/rowhead.gif',
      '/stylesheets/jqt/img/toggle.png',
      '/stylesheets/jqt/img/toggleOn.png',
      '/stylesheets/jqt/img/toolbar.png',
      '/stylesheets/jqt/img/whiteButton.gif'
    ]
});

$(function() {
  $('input').change(function() {
    var url = $(this).val();
    var on = $(this).attr('checked');
    var master_switch = !/\d+/.test(url);

    if (on) {
      url += '/on'
    }
    else {
      url += '/off'
    }

    if (master_switch) {
      $('input').attr('checked', on);
    }

    $.get(url);
  });
});
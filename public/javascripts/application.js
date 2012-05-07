(function(){
  window.dvpzt = jQuery.extend({
    init: function(){
      dvpzt.navigationAjax();
    },

    navigationAjax: function() {
      $('.content > nav a').live('click', function(event){
        var url = $(this).attr('href').replace('/' , '');
        var page = $('.content > section');
        var loader = "<img src='/images/loader.gif' class='spinner' />"

        var request = $.ajax({
          url: '/' + url,
          type: 'GET',
          dataType: 'html',

          beforeSend: function(){
            page.html(loader);
          }
        });

        request.done(function(data){
          page.removeClass();
          page.addClass(url);
          page.html(data);
        });

        request.fail(function(jqXHR, textStatus){
          page.html(textStatus);
        })
        event.preventDefault();
      });
    }

  });
$().ready(dvpzt.init);
}).call(this);

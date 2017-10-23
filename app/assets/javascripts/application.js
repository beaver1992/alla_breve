// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets

function scrollNav() {
    $('.mp__nav a').click(function (e) {
        var href = $(e.target).attr('href');
        //Toggle Class
        $('li.active').removeClass('active');
        $(this).parent('li').addClass('active');
        //Animate
        $('html, body').stop().animate({
            scrollTop: $(href).offset().top
        }, 400);
    });
    $('.scrollTop a').scrollTop();
}

window.onpopstate = function(e) {
    if ($('.mp__nav').length > 0) {
        var href = window.location.hash;
        if (!href) href = '#' + $('section').first().attr('id');
        $('li.active').removeClass('active');
        $("a[href='" + href + "']").parent('li').addClass('active');
        $('html, body').stop().animate({
            scrollTop: $(href).offset().top
        }, 400);
    }
}

document.addEventListener('turbolinks:before-visit', function(e) {
    if (e.data.url.split('#')[1] == 'about_school') {
        e.preventDefault()
        Turbolinks.visit('/')
    }
})

document.addEventListener('turbolinks:load', function () {
    scrollNav();
})

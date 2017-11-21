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

var mutex = false;

function scrollToEl(id) {
    mutex = true
    $('li.active').removeClass('active');
    $("a[href='" + id + "']").parent('li').addClass('active');
    var href = id
    if (href == '#about_school') {
        href = '/'
        $('.main-page').removeClass('main-page_no-title');
    } else {
        $('.main-page').addClass('main-page_no-title');
    }
    history.pushState({}, id, href)
    $('html, body').stop().animate({
        scrollTop: $(id).offset().top
    }, 1000, function () {
        mutex = false
    });
    $('.scrollTop a').scrollTop();
}

$(window).on('mousewheel', function (e, delta) {
    if (!mutex) {
        if (e.originalEvent.wheelDelta / 120 > 0) {
            var target = $('li.active').prev('li')
            if (target.length > 0) scrollToEl(target.find('a').attr('href'))
        } else {
            var target = $('li.active').next('li')
            if (target.length > 0) scrollToEl(target.find('a').attr('href'))
        }
    } else {
        e.preventDefault();
        e.stopPropagation();
    }
})

window.onpopstate = function (e) {
    e.preventDefault();
    e.stopPropagation();
    if ($('.mp__nav').length > 0) {
        var id = window.location.hash;
        if (!id) id = '#' + $('section').first().attr('id');
        scrollToEl(id);
    }
}

document.addEventListener('turbolinks:before-visit', function (e) {
    if (e.data.url.split('#')[1] == 'about_school') {
        e.preventDefault()
        e.stopPropagation()
        Turbolinks.visit('/')
    }
})

function initYmap(){
    new ymaps.Map("ymap", {
        center: [55.76, 37.64],
        zoom: 7
    });
}

document.addEventListener('turbolinks:load', function () {
    if ($('.mp__nav').length > 0 && window.location.hash) scrollToEl(window.location.hash)

    $('.mp__nav a').on('click', function (e) {
        e.preventDefault();
        e.stopPropagation();
        var id = $(this).attr('href');
        scrollToEl(id)
    })

    ymaps.ready(initYmap);
})

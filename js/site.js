$(function () {
    $.localScroll({ filter: '.smoothScroll' });

    $(window).scroll(function () {
        var collapse = $('#navbarCollapseContent');
        if (!collapse.hasClass('show')) {
            toggleAvatarDisplay($(this).scrollTop() > 25);
        }
    });

    var mainNav = $('#main-nav');
    mainNav.on('show.bs.collapse', function () {
        toggleAvatarDisplay(true);
    });

    mainNav.on('hide.bs.collapse', function () {
        toggleAvatarDisplay(false);
    });
});

function toggleAvatarDisplay(hide) {
    var avatar = $('.card-img-overlay');
    if (hide) {
        avatar.addClass('card-img-overlay-hidden');
    }
    else {
        avatar.removeClass('card-img-overlay-hidden');
    }
}
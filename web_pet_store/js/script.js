$(document).ready(function () {
    $('.btns').click(function (e) {
        console.log("clicked");
        location.reload();
    });
    $('html, body').animate({
        scrollTop: $("#table").offset().top
    }, 0);
});
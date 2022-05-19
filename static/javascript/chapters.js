$('.btn').click(function () {
    $(this).toggleClass("click");
    $('.sidebar').toggleClass("show");
    $('.image2').toggleClass("rotate");
});


$('.feat-btn').click(function () {
    $(this).siblings('ul').toggleClass("show");
    $(this).children('.image').toggleClass("rotate");
});


$('.li').click(function () {
    $(this).addClass("active").siblings().removeClass("active");
});

$('.inner-li').mouseover(
    function () {
        $(this).children().css('color', '#8167a9');
    }
);

$('.inner-li').mouseout(
    function () {
        $(this).children().css('color', '#e6e6e6');
    }
);



$(document).ready(function () {
    $('.text').slideUp(1000);
    $(".right").click(function () {
        if ($(this).hasClass('rotate')) {
            $(this).removeClass('rotate'); ''
            $(this).parent().parent().siblings('.rest').children('.col-12').children('.text').slideUp();
        } else {
            $(this).addClass('rotate');
            $(this).parent().parent().siblings('.rest').children('.col-12').children('.text').slideDown();
        }

    });
});

$(".right").hover(function () {
    $(this).css('cursor', 'pointer');
});

$(".inner-li").click(function () {
    move = $('#' + $(this).children('.inner-a').text().replace(/ /g, '')).children('div.row.first').children().eq(1).children('img.right');
    $('.text').not(move.parent().parent().siblings('.rest').children('.col-12').children('.text')).slideUp();
    $('.right').not(move).removeClass('rotate')
    $([document.documentElement, document.body]).animate({
        scrollTop: $('#' + $(this).children('.inner-a').text().replace(/ /g, '')).offset().top - 100
    });
    $('.btn').removeClass("click");
    $('.sidebar').removeClass("show");
    $('.image2').removeClass("rotate");
    move.addClass('rotate');
    move.parent().parent().siblings('.rest').children('.col-12').children('.text').slideDown();


});


function validate() {
    $(this).removeClass("onclic");
    $(this).addClass("validate");
}
function callback() {

    $(this).removeClass("validate");
}


$('.button').click(function () {
    $(this).addClass("onclic");

    completed = $(this).parent().parent().parent().parent().attr('id');
    $.ajax({
        data: {
            chapter: completed
        },
        type: 'POST',
        url: '/chapters'
    })
        .done(function (data) {
            if (data.success) {
                $(this).queue(validate).queue(callback).attr('disabled', 'disabled').css('pointer-events', 'none');   
            }

        });

})


function get(name) {
    if (name = (new RegExp('[?&]' + encodeURIComponent(name) + '=([^&]*)')).exec(location.search))
        return decodeURIComponent(name[1]);
}


$(document).ready(function () {
    if (!(get('test').slice(0, 1) == 'C' || get('test').slice(0, 1) == 'Q')) {
        $('.readmore').hide()
    }
});

$('.readmore').click(function () {
    if (get('test').slice(0, 1) == 'C' || get('test').slice(0, 1) == 'Q') {
        $btn = $(this)
        if ($btn.hasClass('done')) {
            Swal.fire({
                icon: 'info',
                text: 'You have already submitted this question!'
            });
        } else if ($(this).siblings("input").val() == "") {
            Swal.fire({
                icon: 'info',
                text: 'Enter your answer!'
            });
        } else {
            question = $(this).parent().siblings("h5").children('span').text();
            answer = $(this).siblings("input").val();
            var $answer_p = $(this).parent().siblings('p')
            $.ajax({
                data: {
                    question: question,
                    answer: answer
                },
                type: 'POST',
                url: '/rightanswer'
            })
                .done(function (data) {
                    $btn.addClass('done').text('Submitted');
                    if (data.error) {
                        Swal.fire({
                            icon: 'error',
                            text: data.error
                        });
                    } else if (data.success) {
                        $answer_p.removeClass('invisible')
                        $answer_p.addClass('right')
                        $answer_p.text(data.success)
                    }
                    else if (data.false) {
                        $answer_p.removeClass('invisible')
                        $answer_p.addClass('wrong')
                        $answer_p.text(data.false)

                    }
                });
        }
    }
});


$('input[type=radio]').click(function () {
    $radio = $(this)
    question = $radio.siblings('h5').children('span').text()
    answer = $radio.attr('value');
    $answer_p = $(this).siblings('p')
    if (get('test').slice(0, 1) == 'C' || get('test').slice(0, 1) == 'Q') {
        $.ajax({
            data: {
                question: question,
                answer: answer
            },
            type: 'POST',
            url: '/rightanswer'
        })
            .done(function (data) {
                $radio.siblings('input[type=radio]').each(function (index) {
                    $(this).attr("disabled", true);

                });

                if (data.error) {
                    Swal.fire({
                        icon: 'error',
                        text: data.error
                    });
                } else if (data.success) {
                    $answer_p.removeClass('invisible')
                    $answer_p.addClass('right')
                    $answer_p.text(data.success)
                }
                else if (data.false) {
                    $answer_p.removeClass('invisible')
                    $answer_p.addClass('wrong')
                    $answer_p.text(data.false)

                }
            });
    } else {
        $.ajax({
            data: {
                question: question,
                answer: answer
            },
            type: 'POST',
            url: '/rightanswer'
        })
            .done(function (data) {
                $radio.siblings('input[type=radio]').each(function (index) {
                    $(this).attr("disabled", true);

                });

                if (data.error) {
                    Swal.fire({
                        icon: 'error',
                        text: data.error
                    });
                } else if (data.success) {
                    $answer_p.addClass('right')
                }
                else if (data.false) {
                    $answer_p.addClass('wrong')

                }
            });
    }
});



$('#submit').click(function () {
    if (get('test').slice(0, 1) == 'C' || get('test').slice(0, 1) == 'Q') {

        if ($("p.invisible").length == 0) {
            score = (($("p.right").length / ($("p.right").length + $("p.wrong").length)) * 100).toFixed(2)
            $.ajax({
                data: { score: score, test: get('test') },
                type: 'POST',
                url: '/submitanswer'
            })
                .done(function (data) {
                    if (data.error) {
                        Swal.fire({
                            icon: 'error',
                            text: data.error
                        }).then(function () {
                            window.location = "chapters";
                        });
                    } else if (data.success) {
                        Swal.fire({
                            icon: 'success',
                            text: data.success
                        }).then(function () {
                            window.location = "chapters";
                        });
                    }
                });
        } else {
            Swal.fire({
                icon: 'error',
                text: 'You have to complete all the questions and also check your answers in the gap-filling questions!'
            });
        }
    } else {


        $('input[id^="gap"]').each(function (index) {
            if ($(this).val() == "") {
                Swal.fire({
                    icon: 'info',
                    text: 'Enter your answers!'
                });
            } else {
                question = $radio.siblings('h5').children('span').text();
                answer = $(this).val();
                var $answer_p = $(this).parent().siblings('p')
                $.ajax({
                    data: {
                        question: question,
                        answer: answer
                    },
                    type: 'POST',
                    url: '/rightanswer'
                })
                    .done(function (data) {
                        if (data.error) {
                            Swal.fire({
                                icon: 'error',
                                text: data.error
                            });
                        } else if (data.success) {
                            $answer_p.addClass('right')
                            $answer_p.text(data.success)
                        }
                        else if (data.false) {
                            $answer_p.addClass('wrong')
                            $answer_p.text(data.false)

                        }
                    });
            }
        });

        if ($("p.right").length + $("p.wrong").length == 6) {
            score = (($("p.right").length / ($("p.right").length + $("p.wrong").length)) * 100).toFixed(2)
            $.ajax({
                data: { score: score, test: get('test') },
                type: 'POST',
                url: '/submitanswer'
            })
                .done(function (data) {
                    if (data.error) {
                        Swal.fire({
                            icon: 'error',
                            text: data.error
                        }).then(function () {
                            window.location = "chapters";
                        });
                    } else if (data.success) {
                        Swal.fire({
                            icon: 'success',
                            text: data.success
                        }).then(function () {
                            window.location = "chapters";
                        });
                    }else if  (data.info){
                        Swal.fire({
                            icon: 'info',
                            text: data.info
                        }).then(function () {
                            window.location = "chapters";
                        });
                    }

                });
        } else {
            Swal.fire({
                icon: 'error',
                text: 'You have to complete all the questions!'
            });
        }

    }
});
/*global $, document, window, setTimeout, navigator, console, location*/
$(document).ready(function () {

    'use strict';

    var usernameError = true,
        emailError    = true,
        passwordError = true,
        passConfirm   = true,
        ageError=true;

    // Detect browser for css purpose
    if (navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
        $('.form form label').addClass('fontSwitch');
    }

    // Label effect
    $('input').focus(function () {

        $(this).siblings('label').addClass('active');
    });

    // Form validation
    $('input').blur(function () {

        // User username
        if ($(this).hasClass('username')) {
            if ($(this).val().length === 0) {
                $(this).siblings('span.error').text('Please type your username').fadeIn().parent('.form-group').addClass('hasError');
                usernameError = true;
            } else if ($(this).val().length > 1 && $(this).val().length <= 6) {
                $(this).siblings('span.error').text('Please type at least 6 characters').fadeIn().parent('.form-group').addClass('hasError');
                usernameError = true;
            } else {
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                usernameError = false;
            }
        }
        // Email
        if ($(this).hasClass('email')) {
            if ($(this).val().length == '') {
                $(this).siblings('span.error').text('Please type your email address').fadeIn().parent('.form-group').addClass('hasError');
                emailError = true;
            } else {
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                emailError = false;
            }
        }

        // PassWord
        if ($(this).hasClass('pass')) {
            if ($(this).val().length < 8) {
                $(this).siblings('span.error').text('Please type at least 8 charcters').fadeIn().parent('.form-group').addClass('hasError');
                passwordError = true;
            } else {
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                passwordError = false;
            }
        }


        if ($(this).hasClass('age')) {
            if ( $(this).val().length===0  || $(this).val() <5 || $(this).val() >99 ) {
                $(this).siblings('span.error').text('Please enter an age between 5 and 99').fadeIn().parent('.form-group').addClass('hasError');
                ageError = true;
            } else {
                $(this).siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
                ageError = false;
            }
        }

        // PassWord confirmation
        if ($('.pass').val() !== $('.passConfirm').val()) {
            $('.passConfirm').siblings('.error').text('Passwords don\'t match').fadeIn().parent('.form-group').addClass('hasError');
            passConfirm = true;
        } else {
            $('.passConfirm').siblings('.error').text('').fadeOut().parent('.form-group').removeClass('hasError');
            passConfirm = false;
        }

        // label effect
        if ($(this).val().length > 0) {
            $(this).siblings('label').addClass('active');
        } else {
            $(this).siblings('label').removeClass('active');
        }
    });


    // form switch
    $('a.switch').click(function (e) {
        $(this).toggleClass('active');
        e.preventDefault();

        if ($('a.switch').hasClass('active')) {
            $(this).parents('.form-peice').addClass('switched').siblings('.form-peice').removeClass('switched');
        } else {
            $(this).parents('.form-peice').removeClass('switched').siblings('.form-peice').addClass('switched');
        }
    });


    // Form submit
    $('form.signup-form').submit(function (event) {

        if (usernameError == true || emailError == true || passwordError == true || passConfirm == true || ageError==true) {
            event.preventDefault();
            $('.username, .email, .pass, .passConfirm, .age, .level').blur();
        }else{
            $(this).unbind('submit').submit()
        }
    });

    // Reload page
    $('a.profile').on('click', function () {
        location.reload(true);
    });


});

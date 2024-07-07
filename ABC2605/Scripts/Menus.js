//rebuilt menu's (plugin doesnt work) , done by looping through odd and even clicks, changing class at attr of id's


//Full Menu
$('.button-hamburger').click(function () {
    var clicks = $(this).data('clicks');

    if (clicks) {
        $('#secondary-menu').removeClass('is-active');


    } else {

        $('#secondary-menu').addClass('is-active');


    }
    $(this).data("clicks", !clicks);
});

//Study menu

$('#studysubmenubutton').click(function () {
    var clicks = $(this).data('clicks');

    if (clicks) {
        $('#study-submenu').attr('aria-hidden', 'true');


    } else {
        $('#study-submenu').attr('aria-hidden', 'false');


    }
    $(this).data("clicks", !clicks);
});

//Student Experience menu

$('#studentexperiencesubmenubutton').click(function () {
    var clicks = $(this).data('clicks');

    if (clicks) {
        $('#student-experience-submenu').attr('aria-hidden', 'true');


    } else {
        $('#student-experience-submenu').attr('aria-hidden', 'false');


    }
    $(this).data("clicks", !clicks);
});

//Apply menu

$('#applysubmenubutton').click(function () {
    var clicks = $(this).data('clicks');

    if (clicks) {
        $('#apply-submenu').attr('aria-hidden', 'true');


    } else {
        $('#apply-submenu').attr('aria-hidden', 'false');


    }
    $(this).data("clicks", !clicks);
});


//About menu

$('#aboutsubmenubutton').click(function () {
    var clicks = $(this).data('clicks');

    if (clicks) {
        $('#about-submenu').attr('aria-hidden', 'true');


    } else {
        $('#about-submenu').attr('aria-hidden', 'false');


    }
    $(this).data("clicks", !clicks);
});

//information-for menu

$('#informationsubmenubutton').click(function () {
    var clicks = $(this).data('clicks');

    if (clicks) {
        $('#information-for-submenu').attr('aria-hidden', 'true');


    } else {
        $('#information-for-submenu').attr('aria-hidden', 'false');


    }
    $(this).data("clicks", !clicks);
});

//visit-us menu

$('#visitussubmenubutton').click(function () {
    var clicks = $(this).data('clicks');

    if (clicks) {
        $('#visit-us-submenu').attr('aria-hidden', 'true');


    } else {
        $('#visit-us-submenu').attr('aria-hidden', 'false');


    }
    $(this).data("clicks", !clicks);
});

//Courses menu

$('#coursessubmenubutton').click(function () {
    var clicks = $(this).data('clicks');

    if (clicks) {
        $('#courses-submenu').attr('aria-hidden', 'true');


    } else {
        $('#courses-submenu').attr('aria-hidden', 'false');


    }
    $(this).data("clicks", !clicks);
});


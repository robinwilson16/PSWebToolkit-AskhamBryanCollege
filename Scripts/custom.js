$(function () {
    //apply date control to date fields
    //CCCPS-75350 - updating date picker to display until current year + 2
    $("input[ID*='Date']").datepicker({ dateFormat: "dd/mm/yy", changeMonth: true, changeYear: true, yearRange: "-100:+2" })
    $("input[ID*='SchoolAttendedFrom']").datepicker({ dateFormat: "dd/mm/yy", changeMonth: true, changeYear: true, yearRange: "-100:+0" });
    $("input[ID*='SchoolAttendedTo']").datepicker({ dateFormat: "dd/mm/yy", changeMonth: true, changeYear: true, yearRange: "-100:+2" });

    //Change width of form control span for checkboxes
    $("input[type='checkbox']").parent(".form-control").attr('style', 'width:40px');

    //highlight error fields
    $(".form-group span .error").parent().find('.textfield').css("border", "1px red solid");

    $('img[src="_images/basketsmall.png"]').click(function () { window.location.href = 'webenrolment.aspx?page=~/webcontrols/checkout.ascx' });
    //Had to setup some fixes for issues that came while working on accessibility stuff. Mainly it occurred on server controls and added dynamically.
    $('input[type="submit"]').each(function () {
        if ($(this).prop('disabled')) {
            if ($(this).parent('span')) { 
                $(this).parent('span').removeClass();
                $(this).parent('span').addClass('aspNetDisabled');
            }            
        }
    });
    if ($('span.form-control').length > 0) { 
        $('span.form-control').each(function () {
            var ariaLabelledBy = $(this).attr('aria-labelledby');
            var $checkbox = $(this).find(':input[type="checkbox"]');

            if ($checkbox.length) {
                $checkbox.attr('aria-labelledby', ariaLabelledBy);
                $(this).removeAttr('aria-labelledby');
            }
        });
    }
    $('[data-toggle="tooltip"]').tooltip();
});

//toastr notification code
function DisplayToast(m, t, p) {
    toastr.options.positionClass = p;
    toastr.options.timeout = '3000';
    switch (t) {
        case "Success":
            toastr.success(m);
            break;
        case "Error":
            toastr.error(m);
            break;
        case "Info":
            toastr.info(m);
            break;
        case "Warning":
            toastr.warning(m);
            break;
    }
}

function setupAriaObserverForToggleControls(triggerCtrl, panelCtrl) { 
    //const target = document.getElementById('divFeeInfo');
    // Create a new Intersection Observer
    const observer = new IntersectionObserver(entries => {
        // Callback function to handle intersection changes
        entries.forEach(entry => {
            $(triggerCtrl).attr("aria-expanded", entry.isIntersecting);
            $(panelCtrl).attr("aria-hidden", !entry.isIntersecting);            
        });
    });

    // Start observing the target element
    observer.observe(panelCtrl);
}
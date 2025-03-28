// Check if jQuery is loaded
if (typeof django === 'undefined' || typeof django.jQuery === 'undefined') {
    var script = document.createElement('script');
    script.src = "https://code.jquery.com/jquery-3.6.0.min.js";
    script.onload = function() {
        console.log("jQuery loaded manually!");

        // Once jQuery is loaded, initialize Select2
        initSelect2();
    };
    document.head.appendChild(script);
} else {
    // jQuery is already available, initialize Select2 immediately
    initSelect2();
}

// Function to initialize Select2
function initSelect2() {
    (function($) {
        $(document).ready(function() {
            $("#id_tech_stack, #id_features").select2({
                tags: true,
                tokenSeparators: [',']
            });
        });
    })(django.jQuery);
}

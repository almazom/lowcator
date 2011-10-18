// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .


function alert(msg) {
    $('.alert-message').find('p').html(msg).end().show();

}


$(document).ready(function() {
    $(".alert-message").alert();
    $('.alert-message').hide();

    $.ajaxSetup({
        'beforeSend': function(xhr) {
            xhr.setRequestHeader("Accept", "text/javascript")
        }
    });


    $('.pane-close.toolbar-control').live("click", function() {
        $('.details-pane').toggle('slow');
    });

    $('.stream-item').hover(function() {

        $(this).find(".more").show();
    }, function() {
        $(this).find(".more").hide();
    })
});
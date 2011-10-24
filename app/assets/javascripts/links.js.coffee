# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


error_ajax = () ->
  alert("error")

update_comments_success = (data) ->
  $('.comments_place').fadeTo('slow','.3', -> $(this).html(data).fadeTo('fast','1'))
  setTimeout("$('.details-pane').hide('fast')",1500);

window.update_comments = (link_id) ->
  $.ajax
    type: "get"
    url: "/links/#{link_id}/comments"
    dataType: "html"
    success: update_comments_success
    error: error_ajax


$(document).ready ->
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


error_ajax = () ->
  alert("error")


window.update_comments = (link_id) ->
  console.log(1)
  $.ajax
    type: "get"
    url: "/links/#{link_id}/comments"
    dataType: "html"
    success: (msg) ->
    error: error_ajax

#  $('.comments_place').html(msg)


$(document).ready ->
#  $('#link_tag_list').autocomplete({source: "/ajax/users"})
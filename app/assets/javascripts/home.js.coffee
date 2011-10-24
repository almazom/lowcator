# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/




window.switch_to_unforited = (msg, link_id) ->
  tweet = $('.tweet[data-link_id = '+link_id+']')
  $.ajax
    type: "get"
    url: "/links/#{link_id}/show_custom_link"
    dataType: "html"
    success: (msg) -> $(tweet).closest('.stream-item').html(msg)
    error: error_ajax

switch_to_favorites_success = (data) ->
  $('.stream-items').html(data)
  $('li.active').removeClass('active')
  $('li.favorits_tab').addClass('active')


switch_to_results_success = (data) ->
  $('.stream-items').html(data)
  $('li.active').removeClass('active')
  $('li.results_tab').addClass('active')


switch_to_my_links_success = (data) ->
  $('.stream-items').html(data)
  $('li.active').removeClass('active')
  $('li.my_links_tab').addClass('active')


error_ajax = () -> alert('Ajax error!')

bind_favorits_tab = () ->
  $('.favorits_tab a').live 'click', (e) ->
    $.ajax
      type: "get"
      url: "/users/1/favorits"
      dataType: "html"
      success: switch_to_favorites_success
      error: error_ajax


bind_results_tab = () ->
  $('.results_tab a').live 'click', (e) ->
    $.ajax
      type: "get"
      url: "/"
      dataType: "html"
      success: switch_to_results_success
      error: error_ajax


bind_results_tab = () ->
  $('.results_tab a').live 'click', (e) ->
    $.ajax
      type: "get"
      url: "/"
      dataType: "html"
      success: switch_to_results_success
      error: error_ajax

bind_my_links_tab = () ->
  $('.my_links_tab a').live 'click', (e) ->
    $.ajax
      type: "get"
      url: "/links"
      dataType: "html"
      success: switch_to_my_links_success
      error: error_ajax



link_expand_success = (data) ->
  $('.details-pane').show().find('.tweet-row').html(data)

link_expand = () ->
  $('.span10 .tweet').live 'click', () ->
    $.ajax
      type: "get"
      url: "/links/"+$(this).attr('data-link_id')
      dataType: "html"
      success: link_expand_success
      error: error_ajax


cl = (msg) ->
  console.log(msg)

lastPostFunc = () ->
  console.log('bottom')
  elements_on_page = $('.stream-items .stream-item').length
  $('.stream-items').fadeTo('slow','.1')
  cl elements_on_page

  $.ajax
    type: "get"
    url: "/"
    data: "offset=#{elements_on_page}"
    dataType: "html"
    success: (msg) -> $('.stream-items .stream-item:last').after(msg); $('.stream-items').fadeTo('slow','1')
    error: error_ajax




detect_on_scrall_2_the_bottom = () ->
  $(window).scroll -> lastPostFunc()  if $(window).scrollTop() is $(document).height() - $(window).height()

$(document).ready ->
  bind_favorits_tab()
  bind_results_tab()
  bind_my_links_tab()
  link_expand()
  detect_on_scrall_2_the_bottom()

  $('.details-pane').height($(document).height()-100)


  $('.js-toggle-fav').live 'click', ->
      link = $(this)

      if $(link).hasClass('favorite-action')
        $(link).find('form').submit()
        false
      else
        $(link).closest('.hide_my_link_of_unfovarite').find('a').click()
        false
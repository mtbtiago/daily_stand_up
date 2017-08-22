# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.App ||= {}

App.init = ->
  self = @
  # This sample demostrates CoffeeScript is enabled
  $('#btn_sample').on 'click', (evt) ->
    $('#btn_sample').hide()

# event binding
$(document).on "turbolinks:load", -> App.init()

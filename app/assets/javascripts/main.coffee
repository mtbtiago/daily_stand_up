# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.App ||= {}

App.init = ->
  self = @

  poll_closes_at = $('#poll_closes_at').data('time')
  if poll_closes_at
    setInterval () ->
      future = moment(parseFloat(poll_closes_at))
      $('#poll_closes_at').html("(aprox. #{moment(future).fromNow()})")
      console.log(moment.locale())
     ,1000


# event binding
$(document).on "turbolinks:load", -> App.init()

App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    console.log('connected');

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.message.blank?
      $('#messages-table').append data.message
      scroll_bottom();

scroll_bottom = () ->
  $("#messages").scrollTop($('#messages')[0].scrollHeight);

$(document).on 'turbolinks:load', ->
  submit_message();
  scroll_bottom();

submit_message = () ->
  $("#message_content").on 'keydown', (event) ->
    if event.keyCode is 13
      $('#new_message').submit();
      event.target.value = ''
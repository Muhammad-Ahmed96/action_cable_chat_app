App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    console.log('connected');

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.content.blank?
      $('#messages-table').append "<div class='message'>" +
                                    "<div class='message-user'>" +
                                      data.username + ":" +
                                    "</div>" +
                                    "<div class='message-content'>" +
                                      data.content +
                                    "</div>"+
                                  "</div>"


$(document).on 'turbolinks:load', ->
  submit_message()

submit_message = () ->
  $("#message_content").on 'keydown', (event) ->
    if event.keyCode is 13
      $('#new_message').submit();
      event.target.value = ''
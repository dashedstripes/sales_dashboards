App.deal = App.cable.subscriptions.create "DealChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#dealMessage').empty().append data['message']
    $('#dealMessageContainer').fadeIn()
    
    clearMessage = () ->
      $('#dealMessageContainer').fadeOut()
    
    setTimeout(clearMessage, 1000)

  new: (message) ->
    @perform 'new', message: message

$(document).on 'click', '#dealSubmit', (e) ->
  if ($('#dealInput').val() != '')
    App.deal.new($('#dealInput').val())
    $('#dealInput').val('')
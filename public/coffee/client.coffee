define(['socket-io'], (io) ->

  class Client
    constructor: (channelID, username) ->
      @channelID = channelID
      @username = username
      @socket = io.connect()

      @socket.emit('join', channelID, username)
      @socket.on('update', (data) ->
        console.log data.message
      )

  return Client
)

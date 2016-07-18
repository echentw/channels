define(['socket-io'], (io) ->

  class Client
    constructor: (channelID, username) ->
      @channelID = channelID
      @username = username
      @socket = io.connect()

  return Client
)

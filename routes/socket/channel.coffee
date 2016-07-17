io = null
database = null

join = (channelID) ->
  channel = database.find(channelID)
  if !channel
    this.emit('error', {message: 'Authentication failed.'})
    return

  success = channel.addUser('username')
  if !success
    this.emit('error', {message: 'Username already exists.'})
    return

  io.join(channelID)

disconnect = ->

module.exports.attach = (socketIO, db) ->
  database = db
  io = socketIO

  io.sockets.on('connection', (socket) ->
    socket.on('join', join)
    socket.on('disconnect', disconnect)
  )

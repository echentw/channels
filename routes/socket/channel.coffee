io = null
database = null

join = (channelID, username) ->
  socket = this

  channel = database.find(channelID)
  if !channel
    socket.emit('error', {message: 'Authentication failed.'})
    return

  success = channel.addUser(username)
  if !success
    socket.emit('error', {message: 'Username already exists.'})
    return

  socket.join(channelID)

  io.sockets.in(channelID).emit('update', {
    message: username + ' has joined the channel'
  })

disconnect = ->

module.exports.attach = (socketIO, db) ->
  database = db
  io = socketIO

  io.sockets.on('connection', (socket) ->
    socket.on('join', join)
    socket.on('disconnect', disconnect)
  )

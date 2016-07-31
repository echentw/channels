class Channel
  constructor: ->
    @users = {}
    @disconnectedUsers = {}

  findUser: (username) =>
    return username of @users

  addUser: (username) =>
    if username of @users
      return false
    @users[username] = true
    return true

  removeUser: (username) =>
    if username of @users
      delete @users[username]
      if username of @disconnectedUsers
        delete @disconnectedUsers[username]
      return true
    return false

  connectSocket: (username) =>
    if username of @users
      if username of @disconnectedUsers
        delete @disconnectedUsers[username]

  setTimeout: (username) =>
    if username of @users
      @disconnectedUsers[username] = true
      setTimeout( =>
        if @disconnectedUsers[username]
          @removeUser(username)
      , 2000)

  empty: ->
    return Object.keys(@users).length == 0

module.exports = Channel

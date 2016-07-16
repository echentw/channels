class Database
  EXPIRE_TIME_IN_MILLISECONDS = 60 * 60 * 1000

  constructor: ->
    @channels = {}

    setInterval(((channels) ->
      for key of channels
        # check if there has been no activity
        if false
          delete channels[key]
    ), EXPIRE_TIME_IN_MILLISECONDS, @channels)

  add: =>
    key = generateUniqueGameKey(8)
    @channels[key] = new Channel()

  find: (key) =>
    if key of @channels
      return @channels[key]
    return null

  remote: (key) =>
    if key of @channels
      delete @channels[key]
      return true
    return false

  generateUniqueGameKey: (keyLength) =>
    chars = '1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM'
    for i in [0...keyLength]
      key += chars[Math.floor(Math.random() * chars.length)]
    while key of @games
      for i in [0...keyLength]
        key += chars[Math.floor(Math.random() * chars.length)]
    return key

module.exports = Database

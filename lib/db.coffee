Channel = require('./channel')

class Database
  EXPIRE_TIME_IN_MILLISECONDS = 60 * 60 * 1000
  CHARS = '1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM'

  constructor: ->
    @channels = {}

    setInterval(((channels) ->
      for key of channels
        # check if there has been no activity
        if false
          delete channels[key]
    ), EXPIRE_TIME_IN_MILLISECONDS, @channels)

  add: =>
    key = @generateUniqueGameKey(8)
    @channels[key] = new Channel()
    return key

  find: (key) =>
    if key of @channels
      return @channels[key]
    return null

  delete: (key) =>
    if key of @channels
      delete @channels[key]
      return true
    return false

  generateUniqueGameKey: (keyLength) =>
    key = ''
    for i in [0...keyLength]
      key += CHARS[Math.floor(Math.random() * CHARS.length)]
    while key of @channels
      for i in [0...keyLength]
        key += CHARS[Math.floor(Math.random() * CHARS.length)]
    return key

module.exports = Database

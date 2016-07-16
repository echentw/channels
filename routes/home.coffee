express = require('express')
router = express.Router()

# GET home page
home = (req, res, next) ->
  res.render 'home'
  return

# POST create a channel
createChannel = (req, res, next) ->
  console.log 'create'
  res.render 'home'
  # req.session.regenerate(function(err) {
  #   if (err) {
  #     res.redirect('/');
  #     return;
  #   }
  # });
  return

# POST join a channel
joinChannel = (req, res, next) ->
  console.log 'join'
  res.render 'home'
  return

# Attach route handlers to the app
module.exports.attach = (app, db) ->
  database = db

  app.get('/', home)
  app.post('/create', createChannel)
  app.post('/join', joinChannel)

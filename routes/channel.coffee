express = require('express')
router = express.Router()

# GET channel page
router.get('/:id', (req, res, next) ->
  # validate the request
  if !req.session.channelID ||
      !req.session.username ||
      req.session.channelID != req.params['id']
    req.redirect('/')

  res.render('channel', {
    channelID: req.session.channelID,
    username: req.session.username
  })
)

module.exports = router

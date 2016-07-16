express = require('express')
router = express.Router()

# GET channel page
router.get('/:id', (req, res, next) ->
  channelID = req.params['id']
  res.render('channel')
)

module.exports = router

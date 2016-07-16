express = require('express')
router = express.Router()

# GET channel page
router.get('/', (req, res, next) ->
  res.render 'channel'
  return
)

module.exports = router

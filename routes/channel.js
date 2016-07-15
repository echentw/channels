var express = require('express');
var router = express.Router();

/* GET channel apge */
router.get('/', function(req, res, next) {
  res.render('channel');
});

module.exports = router;

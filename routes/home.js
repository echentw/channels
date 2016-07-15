var express = require('express');
var router = express.Router();

/* GET home page. */
var home = function(req, res, next) {
  res.render('home');
};

/* POST create a channel */
var createChannel = function(req, res, next) {
  console.log('create');
  res.render('home');
  // req.session.regenerate(function(err) {
  //   if (err) {
  //     res.redirect('/');
  //     return;
  //   }
  // });
};

/* POST join a channel */
var joinChannel = function(req, res, next) {
  console.log('join');
  res.render('home')
};

/* Attach route handlers to the app */
module.exports.attach = function(app, db) {
  database = db;

  app.get('/', home);
  app.post('/create', createChannel);
  app.post('/join', joinChannel);
};

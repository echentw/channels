express = require('express')
path = require('path')
favicon = require('serve-favicon')
logger = require('morgan')
cookieParser = require('cookie-parser')
cookieSession = require('cookie-session')
bodyParser = require('body-parser')
fs = require('fs')

home = require('./routes/home')
channel = require('./routes/channel')

Database = require('./lib/db')

app = express()

# view engine setup
app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'ejs')

# uncomment after placing your favicon in /public
#app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded(extended: false))
app.use(cookieParser())
app.use(cookieSession({
  keys: [
    fs.readFileSync('keys/key0.txt', 'utf8'),
    fs.readFileSync('keys/key1.txt', 'utf8'),
    fs.readFileSync('keys/key2.txt', 'utf8')
  ]
}))
app.use(express.static(path.join(__dirname, 'public')))

# initialize the database, stored in memory
database = new Database()

# attach routes
home.attach(app, database)
app.use('/channel', channel)

# catch 404 and forward to error handler
app.use((req, res, next) ->
  err = new Error('Not Found')
  err.status = 404
  next(err)
)

# error handlers
# development error handler
# will print stacktrace
if app.get('env') == 'development'
  app.use((err, req, res, next) ->
    res.status err.status || 500
    res.render('error',
      message: err.message
      error: err
    )
  )

# production error handler
# no stacktraces leaked to user
app.use((err, req, res, next) ->
  res.status(err.status || 500)
  res.render('error',
    message: err.message
    error: {}
  )
)

module.exports = app

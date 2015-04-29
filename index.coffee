#!/usr/bin/env node
express = require('express')
app = express()
app.set 'port', process.env.PORT or 5000

bunyan = require('bunyan')
log = bunyan.createLogger {name: "fitns"}

hbs = require('express-hbs')
app.engine 'hbs', hbs.express4
  partialsDir: __dirname + '/templates/partials'
  defaultLayout:  __dirname + '/templates/layout/app.hbs'
  layoutsDir: __dirname + '/templates/layout'

app.set 'view engine', 'hbs'
app.set 'views', __dirname + '/templates'
# @link Options hbs #express4  https://github.com/barc/express-hbs

app.get '/', (req, res) ->
  res.render 'pages/index',
    title: 'Fit NS'
    header_title: 'FitNS'
  return

app.get '/status', (req, res) ->
  res.json msg: 'server online tmp'
  return

app.use express.static(__dirname + '/public')

app.listen app.get('port'), ->
  log.info('Node app is running at localhost:' + app.get('port'))
  return

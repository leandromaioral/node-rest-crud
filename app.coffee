app = require('express')()
mongoose = require 'mongoose'
bodyParser = require 'body-parser'
routes = require './routes'
config = require './config.json'

app.use bodyParser.urlencoded({ extended: false })
app.use bodyParser.json()

app.use '/users', routes.users

mongoose.connect config.database.mongoUrl, (err)->
  throw err if err

  app.listen 3000, -> console.log 'Server running in http://localhost:3000'

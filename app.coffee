express = require 'express'
app = express()
mongoose = require 'mongoose'

consts = require './config/consts'
env = process.env.NODE_ENV || 'development'
config = require('./config/environment')[env]
require './config/init'
require('./config/routes')(app)

mongoose.connect config.db, (err) -> 
	if err then console.log err else console.log 'connected to db'

app.get '/', (req, res) ->
  res.json 'server is online! :)'

app.listen config.server.port
console.log "Listening on port #{config.server.port} on #{env}"
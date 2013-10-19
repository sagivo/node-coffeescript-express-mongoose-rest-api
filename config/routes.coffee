module.exports = (app) ->  
  # User routes
  users = require '../app/controllers/users_controller'

  app.get '/users', users.index
  app.post '/users', users.create
  app.get '/users/:id', users.show
  app.post '/users/:id/update', users.update
  app.post '/users/:id/destroy', users.destroy
  
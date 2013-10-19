mongoose = require 'mongoose'
Schema = mongoose.Schema

UserSchema = new Schema
  first_name: type: String, required: true
  last_name: type: String
  email: type: String, required: true, index: true, unique: true
  phone: type: String
  created: type: Date, default: Date.now
  bio: type: String
  fbid: type: String

UserSchema.set 'autoIndex', false #don't index every time the server restart

UserSchema.statics =
  all: (cb) -> this.find().exec(cb)

UserSchema.virtual('name').get ->
  this.name.first + ' ' + this.name.last

User = mongoose.model 'User', UserSchema
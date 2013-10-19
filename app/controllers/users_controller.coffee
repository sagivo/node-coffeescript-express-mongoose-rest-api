mongoose = require 'mongoose'
User = mongoose.model 'User'

exports.index = (req, res) ->
	User.all (err, users) ->
		res.send err if err
		res.json users

exports.create = (req, res) ->
	User.create req.query, (err) ->
		res.send err if err
		res.json status: 'ok'


exports.show = (req, res) ->
  User.findById(req.params.id).exec (err, user) ->
    res.send err if err
    return next new Error 'No user found' unless user
    res.json user
  return

exports.update = (req, res) ->
  User.findByIdAndUpdate req.params.id, req.query, (err, user) ->
    res.send err if err
    return next new Error 'No user found' unless user
    return res.json status: 'ok'
  return

exports.destroy = (req, res) ->
  User.findOneAndRemove req.params.id, (err, user) ->
    res.send err if err
    return next new Error 'No user found' unless user
    res.json status: 'ok'
  return
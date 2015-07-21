mongoose = require 'mongoose'

Users = mongoose.model('users',
  name:
    type: String
    required: true

  email:
    type: String
    required: true)

module.exports = Users

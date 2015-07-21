User = require('../models').users

module.exports =
  index: (req, res) ->
    User.find({}, '-__v').exec (err, users) ->
      throw err if err
      res.json users

  create: (req, res) ->
    user = new User(req.body)

    user.save (err) ->
      if err
        res.status(403).json
          message: 'Could not create the user'
          error: err.name

      else
        res.status(201).json message: 'User successfully created'

  show: (req, res) ->
    User.findById(req.params.id, '-__v').exec (err, user) ->
      throw err if err

      if user
        res.json user
      else
        res.status(404).json message: 'User not found'

  update: (req, res) ->
    User.findById(req.params.id).exec (err, user) ->
      throw err if err

      if user
        user.name = req.body.name if req.body.name
        user.email = req.body.email if req.body.email

        user.save (err, user) ->
          if err
            res.status(403).json
              message: 'Could not update the user'
              error: err.name

          else
            res.status(200).json message: 'User successfully updated'

      else
        res.status(404).json message: 'User not found'

  destroy: (req, res) ->
    User.findByIdAndRemove req.params.id, (err, user) ->
      throw err if err

      if user
        res.status(200).json message: 'User successfully removed'
      else
        res.status(404).json message: 'User not found'

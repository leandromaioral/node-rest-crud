router = require('express').Router()
usersController = require('../controllers').users

router
  .route('/')

  .get(usersController.index)
  .post(usersController.create)

router
  .route('/:id')

  .get(usersController.show)
  .put(usersController.update)
  .delete(usersController.destroy)

module.exports = router

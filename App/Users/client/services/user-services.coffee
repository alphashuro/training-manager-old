class UserService

  # create a user
  createUser: (user) =>
    Meteor.call 'create/user', email, password, (error, userId) =>
      if error
        App.Services.Notification.notify error.message
      else
        console.log 'New user created'

  # log user in
  login: ( email, password, cb ) =>
    Meteor.loginWithPassword email, password, (error) =>
      if error
        App.Services.Notification.notify error.message
        cb error
      else
        App.Services.Notification.notify "#{email} is logged in."
        cb null

  # create user and login
  createUserAndLogin: ( email, password ) =>
    Meteor.call 'create/user', email, password, (error, userId) =>
      if error
        App.Services.Notification.notify error.message
      else
        @loginUser email, password

  makeFacilitator: ( userId ) =>
    Meteor.call 'make/facilitator', userId, (error, userId) =>
      if error
        App.Services.Notification.notify error.message
      else
        App.Services.Notification.notify "#{userId} is now a facilitator"

App.Services.UserClient = new UserService()

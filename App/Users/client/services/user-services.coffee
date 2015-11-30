class UserService

  # create a user
  createUser: (user) =>
    Meteor.call 'create/user', email, password, (error, userId) =>
      if error
        App.Services.Notification.notify error.message
      else
        console.log 'New user created'

  # log user in
  login: ( email, password ) =>
    new Promise (resolve, reject) =>
      Meteor.loginWithPassword email, password, (error) =>
        if error
          App.Services.Notification.notify error.message
          reject error
        else
          App.Services.Notification.notify "#{email} is logged in."
          resolve email

  # create user and login
  createUserAndLogin: ( email, password ) =>
    Meteor.call 'create/user', email, password, (error, userId) =>
      if error
        App.Services.Notification.notify error.message
      else
        @loginUser email, password


App.Services.UserClient = new UserService()

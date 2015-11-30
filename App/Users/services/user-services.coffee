class UserService
  authenticate: ( email, password ) =>
    Meteor.call 'userExists', email, (error, exists) ->
      if error
        App.Services.Notification.notify error.message
        return
      if userExists
        @loginUser email, password

  createUserAndLogin: ( email, password ) =>
    Meteor.call 'user/create', email, password, (error, userId) =>
      if error
        App.Services.Notification.notify error.message
      else
        @loginUser email, password

  loginUser: ( email, password ) =>
    Meteor.loginWithPassword email, password, (error) =>
      if error
        App.Services.Notification.notify error.message
        Meteor.connection.setUserId userId

App.Services.UserClient = new UserService()

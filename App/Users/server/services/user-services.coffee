class UserService
  # check if user exists
  exists: (emailOrUsername) =>
    Meteor.call 'exists/user', (error, exists) =>
      if error
        App.Services.Notification.notify error.reason
      else
        return exists

  createUserAndLogin: (email, password) =>
    userId = Acccounts.createUser { email, password }
    @setUserId userId
    userId

  makeAdmin: (userId) =>
    Roles.addUsersToRoles userId, 'admin'

App.Services.UserServer = new UserService();

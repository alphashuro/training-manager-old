class UserService
  exists: (email) =>
    !!Accounts.findUserByEmail email

  createAndLogin: (email, password) =>
    userId = Acccounts.createUser { email, password }
    @setUserId userId
    userId

App.Services.UserServer = new UserService()

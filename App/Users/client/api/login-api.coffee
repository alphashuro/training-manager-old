login = riot.observable()

login.login = (params) ->
  login.trigger 'loggingIn'
  {email, password} = params
  App.Services.UserClient.login email, password, (error) =>
  	unless error
      login.trigger 'loggedIn'

App.API.login = login

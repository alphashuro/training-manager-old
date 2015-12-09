describe 'Login Tag', ->
  div = undefined

  # create container and mount login tag before each test
  beforeEach ->
    div = document.createElement 'DIV'
    Riot.mount div, 'login', App.API.login

	#returns an element found inside the div, selected by the sel parameter
	el = (sel) ->
		$(div).find(sel)[0]

  it 'Should have input for email and password', ->
		inputs =
	    email : el 'input[name=email]'
	    password : el 'input[name=password]'

    expect(input).toBeDefined() for name, input of inputs

  it 'Should have login button', ->
    loginButton = el 'button#login'
    expect(loginButton).toBeDefined()

  it 'Should call user login service when login button is clicked', ->
    spyOn App.Services.UserClient, 'login'

    loginButton = el '#login'

    loginButton.click()

    expect(App.Services.UserClient.login).toHaveBeenCalled()

  it 'Should call login with email and password from inputs', ->
    spyOn App.Services.UserClient, 'login'

    inputs =
	    email : el 'input[name=email]'
	    password : el 'input[name=password]'

    inputs.email.value = 'user@domain.com'
    inputs.password.value = 'password'

    loginButton = el 'button#login'
    loginButton.click()

    expect(App.Services.UserClient.login).toHaveBeenCalledWith 'user@domain.com', 'password', jasmine.any(Function)

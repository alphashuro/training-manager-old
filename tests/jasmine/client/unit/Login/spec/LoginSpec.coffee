describe 'Login Tag', ->
  div = undefined

  # create container and mount login tag before each test
  beforeEach ->
    div = document.createElement 'DIV'
    Riot.mount div, 'login', App.API.login

  it 'Should have input for email and password', ->
    emailInput = $(div).find('input[name=email]')[0]
    passwordInput = $(div).find('input[name=password]')[0]

    expect(emailInput).toBeDefined()
    expect(passwordInput).toBeDefined()

  it 'Should have login button', ->
    loginButton = $(div).find('button#login')[0]
    expect(loginButton).toBeDefined()

  it 'Should call user login service when login button is clicked', ->
    spyOn App.Services.UserClient, 'login'

    loginButton = $(div).find('#login')[0]

    loginButton.click()

    expect(App.Services.UserClient.login).toHaveBeenCalled()

  it 'Should call login with email and password from inputs', ->
    spyOn App.Services.UserClient, 'login'

    emailInput = $(div).find('input[name=email]')[0]
    passwordInput = $(div).find('input[name=password]')[0]

    emailInput.value = 'user@domain.com'
    passwordInput.value = 'password'

    loginButton = $(div).find('button#login')[0]
    loginButton.click()

    expect(App.Services.UserClient.login).toHaveBeenCalledWith 'user@domain.com', 'password', jasmine.any(Function)

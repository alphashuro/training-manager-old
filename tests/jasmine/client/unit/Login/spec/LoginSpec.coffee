describe 'Login Tag', ->
  div = undefined

  # create container and mount login tag before each test
  beforeEach ->
    div = document.createElement 'DIV'
    Riot.mount div, 'login'

  it 'Has input for email and password', ->
    emailInput = $(div).find('input[name=email]')[0]
    passwordInput = $(div).find('input[name=password]')[0]

    expect(emailInput).toBeDefined()
    expect(passwordInput).toBeDefined()

  it 'Has login button', ->
    loginButton = $(div).find('button#login')[0]

    expect(loginButton).toBeDefined()

  it 'calls user login service when login button is clicked', ->
    spyOn App.Services.UserClient, 'login'

    loginButton = $(div).find('button#login')[0]

    loginButton.click()

    expect(App.Services.UserClient.login).toHaveBeenCalled()

describe 'Login Page', ->
  beforeAll ->
    testUser =
      email: 'user@domain.com'
      password: 'password'
      profile:
        name: 'User'

    Accounts.createUser testUser

  # afterAll ->
  #   # Meteor.call 'clearTestUsers', (error) ->
  #     # if error then console.log error
  #   user = Meteor.users.findOne "profile.name": "User"
  #   Meteor.users.remove user._id

  beforeEach ->
		Meteor.logout()
    FlowRouter.go '/login'
	# 
  # it 'Should be on /login route', ->
  #   currentPath = FlowRouter.current().path
  #   expect(currentPath).toEqual '/login'

  it 'Should have login tag', ->
    loginTag = $('[riot-tag=login]')[0]

    expect(loginTag).toBeDefined()

  it 'Should redirect on successful login', ->
    spyOn( App.Services.UserClient, 'login' ).and.callFake (email, password, cb) ->
      cb()
    spyOn FlowRouter, 'go'

    loginButton = $('button#login')[0]
    loginButton.click()

    expect(FlowRouter.go).toHaveBeenCalledWith '/'

  it 'Should not redirect when login unsuccessful', ->
    spyOn( App.Services.UserClient, 'login' ).and.callFake (email, password, cb) ->
      cb new Meteor.Error 'Login failed'
    spyOn FlowRouter, 'go'

    loginButton = $('button#login')[0]
    loginButton.click()

    expect(FlowRouter.go).not.toHaveBeenCalled()

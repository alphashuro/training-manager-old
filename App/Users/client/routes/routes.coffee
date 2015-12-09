App.publicRoutes.route '/login',
	name: 'login'
	action: ->
		RiotLayout.render 'login', App.API.login

App.API.login.on 'loggedIn', -> FlowRouter.go '/'

App.publicRoutes.route '/enroll-account/:token',
	name: 'enroll'
	action: ->
		RiotLayout.render 'eroll-account'

Meteor.startup ->
	# Tracker.autorun =>
	# 	path = FlowRouter.current().path
	# 	allowedPaths = [
	# 		'login',
	# 		'enroll-account'
	# 	]
	#
	# 	routeAllowed = false
	#
	# 	for item in allowedPaths
	# 		if path.indexOf item isnt -1
	# 			routeAllowed = true
	#
	if not Meteor.loggingIn() and not Meteor.userId()
		path = FlowRouter.current().path
		if path.indexOf 'enroll-account' isnt -1 and path.indexOf 'login' isnt -1
			FlowRouter.go '/login'
	# 	if FlowRouter.current().path is '/login' and Meteor.userId()
	# 		FlowRouter.go '/'

App.privateRoutes.route '/profile',
	name: 'profile'
	action: ->
		RiotLayout.render 'layout',
			main: '<profile-page />'

App.privateRoutes.route '/settings',
	name: 'settings'
	action: ->
		RiotLayout.render 'layout',
			main: '<settings-page />'

App.privateRoutes.route '/users',
	name: 'users'
	action: ->
		RiotLayout.render 'layout',
			main: '<users-page />'

App.privateRoutes.route '/users/add',
	name: 'add-user'
	action: ->
		RiotLayout.render 'layout',
			main: "<add-user-page />"

App.privateRoutes.route '/users/:_id',
	name: 'view-user'
	action: (params) ->
		RiotLayout.render 'layout',
			main: "<edit-user-page user_id=#{params._id} />"

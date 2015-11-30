FlowRouter.route '/login',	
	name: 'login'
	action: -> 
		RiotLayout.render 'login'

Meteor.startup ->
	Tracker.autorun =>
		if not Meteor.loggingIn() and not Meteor.userId()
			FlowRouter.go '/login'

FlowRouter.route '/profile',
	name: 'profile'
	action: ->
		RiotLayout.render 'layout',
			main: '<profile-page></profile-page>'

FlowRouter.route '/settings',
	name: 'settings'
	action: ->
		RiotLayout.render 'layout',
			main: '<settings-page></settings-page>'
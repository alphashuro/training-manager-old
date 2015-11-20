FlowRouter.route '/login',	
	name: 'login'
	action: -> 
		RiotLayout.render 'login'

Meteor.startup ->
	Tracker.autorun =>
		if not Meteor.loggingIn() and not Meteor.userId()
			FlowRouter.go '/login'
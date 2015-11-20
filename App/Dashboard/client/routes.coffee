FlowRouter.route '/',
	name: 'dashboard'
	action: -> 
		RiotLayout.render 'layout', 
			main: '<dashboard></dashboard>'
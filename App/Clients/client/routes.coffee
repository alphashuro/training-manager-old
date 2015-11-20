FlowRouter.route '/clients',
	action: -> 
		RiotLayout.render 'layout', 
			main: '<clients-page></clients-page>'
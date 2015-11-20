FlowRouter.route '/bookings',
	action: -> 
		RiotLayout.render 'layout', 
			main: '<bookings-page></bookings-page>'
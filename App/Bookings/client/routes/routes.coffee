FlowRouter.route '/bookings',
	action: -> 
		RiotLayout.render 'layout', 
			main: '<bookings-page></bookings-page>'

FlowRouter.route '/bookings/add',
	action: ->
		RiotLayout.render 'layout',
			main: '<add-booking-page></add-booking-page>'
			
FlowRouter.route '/bookings/:_id',
	action: (params) ->
		RiotLayout.render 'layout',
			main: "<edit-booking-page booking_id=#{params._id}></edit-booking-page>"
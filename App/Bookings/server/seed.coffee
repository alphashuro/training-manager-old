chance = new Chance 'bookings'

chance.mixin
	booking: ->
		clients = Clients.find().fetch()
		client = chance.pick clients

		learnerIds = client.learners().map (learner) -> learner._id

		courses = Courses.find().fetch()
		course = chance.pick courses
		courseId = course._id

		classes = Classes.find({courseId}).fetch()

		facilitators = Facilitators.find().fetch()
		facilitator = chance.pick facilitators
		facilitatorId = facilitator._id

		sessions = classes.map (c) ->
			new SessionClass
				date: chance.date year: 2015, month: 10
				classId: c._id
				facilitatorId

		{
			learnerIds
			courseId
			sessions
		}

@createBookings = (bookings = 5) ->
	_.times bookings, ->		
		booking = new Booking chance.booking()
		booking.save()

@resetBookings = -> Bookings.remove({})
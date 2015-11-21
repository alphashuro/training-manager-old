Meteor.startup ->
	resetFacilitators()
	resetCourses()
	resetClients()
	resetBookings()

	createFacilitators()
	createCourses()
	createClients()
	createBookings()
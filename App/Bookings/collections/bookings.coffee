@Bookings = new Mongo.Collection 'bookings'
Ground.Collection Bookings

@SessionClass = Astro.Class
	name: "SessionClass"
	fields:
		classId:
			type: 'string'
		date:
			type: 'date'
			default: -> new Date()
		facilitatorId:
			type: 'string'
	methods:
		class: -> Classes.findOne @classId
		facilitator: -> Facilitators.findOne @facilitatorId

@Booking = Astro.Class
	name: 'Booking'
	collection: Bookings
	fields:
		learnerIds:
			type: 'array'
			default: -> []
		courseId:
			type: 'string'
		sessions:
			type: 'array'
			nested: 'SessionClass'
			default: -> []
	methods:
		# finds all learners who are booked (in @learnerIds)
		learners: -> Learners.find
			_id: $in: @learnerIds

		# toggles if learner is added to this booking or not
		toggleLearner: (learnerId) ->
			if @learnerIds.includes learnerId
				@pull 'learnerIds', learnerId
			else
				@push 'learnerIds', learnerId

		course: -> Courses.findOne @courseId
		# returns the total duration of sessions/classes booked
		hours: -> @sessions.reduce ((memo, session) -> memo + session.class().duration), 0
		# returns total price of sessions/classes booked
		price: -> @sessions.reduce ((memo, session) -> memo + session.class().price), 0
		# returns an array of eventObjects (for fullCalendar.js) from the sessions booked 
		events: -> @sessions.map (s) =>
			#the id is bookingId/classId
			#the title is course : class (facilitator)
			#end date is start date + class duration
			{
				id: "#{@_id}/#{s.classId}"
				title: "#{@course().title}: #{s.class().title} (#{s.facilitator().name})"
				start: moment(s.date)
				end: moment(s.date).add s.class().duration, 'hours'
				url: "/bookings/#{@_id}"
			}

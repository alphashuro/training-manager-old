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
		learners: -> Learners.find _id: $in: @learnerIds
		course: -> Courses.findOne @courseId
		hours: -> @sessions.reduce ((memo, session) -> memo + session.class().duration), 0
		price: -> @sessions.reduce ((memo, session) -> memo + session.class().price), 0
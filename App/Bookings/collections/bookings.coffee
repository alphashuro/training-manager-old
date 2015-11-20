@Bookings = new Mongo.Collection 'bookings'

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
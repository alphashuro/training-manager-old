@Courses = new Mongo.Collection 'courses'
Ground.Collection Courses

@Course = Astro.Class
	name: 'Course'
	collection: Courses
	fields:
		title:
			type: 'string'
		description:
			type: 'string'
		maxStudents:
			type: 'number'
	methods:
		classes: -> Classes.find courseId: @_id
		duration: ->
			classes = @classes.fetch()
			durations = classes.map (c) -> c.duration
			total = durations.reduce ( (m,num) -> m+num ), 0
		price: ->
			classes = @classes.fetch()
			prices = classes.map (c) -> c.price
			total = prices.reduce ( (m,num) -> m+num ), 0
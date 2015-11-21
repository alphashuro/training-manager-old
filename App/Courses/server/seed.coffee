chance = new Chance 'courses'

chance.mixin
	course: ->
		title: chance.capitalize chance.word()
		description: chance.sentence()
		maxStudents: _.random(20)
	'class': (id) ->
		courseIds = Courses.find().fetch().map (course) -> course._id
		courseId = id or chance.pick courseIds

		{
			title: chance.capitalize(chance.word())
			description: chance.sentence()
			duration: _.random(12)
			price: _.random(3000)
			courseId
		}

# take the number of courses and classes
# and creates random seed data
@createCourses = (count = 5, classes = 5) ->
	_.times count, -> 
		course = new Course chance.course()
		course.save()
		_.times classes, ->
			c = new Class chance.class course._id
			c.save()

@resetCourses = -> 
	Classes.remove({})
	Courses.remove({})
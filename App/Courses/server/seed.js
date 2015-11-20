const chance = new Chance('courses');

chance.mixin({
	course() {
		return {
			title: chance.capitalize(chance.word()), 
			description: chance.sentence(), 
			maxStudents: _.random(20)
		}
	},
	'class'(id) {
		let courseIds = Courses.find().fetch().map(course => course._id);
		let courseId = id || chance.pick(courseIds);

		return {
			title: chance.capitalize(chance.word()),
			description: chance.sentence(),
			duration: _.random(12),
			price: _.random(3000),
			courseId
		}
	}
});

// take the number of courses and classes
// and creates random seed data
const create = function(
	count = 5, 
	classes = 5) {
	_.times(count, () => {
		let course = new Course(chance.course());
		course.save();
		_.times(classes, () => {
			let c = new Class(chance.class(course._id));
			c.save();
		});
	});
};

const reset = () => {
	Classes.remove({});
	Courses.remove({});
};


Meteor.startup(function() {
	reset();
	create();
});
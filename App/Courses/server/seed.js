const chance = new Chance('courses');

chance.mixin({
	course() {
		let title = chance.capitalize(chance.word());
		let description = chance.sentence();
		let maxStudents = _.random(20);

		return {
			title, description, maxStudents
		}
	}
});

const create = function(count = 5) {
	_.times(count, () => {
		let course = new Course(chance.course());
		course.save();
	});
}

const reset = () => {
	Courses.remove({});
}


Meteor.startup(function() {
	reset();
	create();
});
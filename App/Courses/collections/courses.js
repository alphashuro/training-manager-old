Courses = new Mongo.Collection('courses');

Course = Astro.Class({
	name: 'Course',
	collection: Courses,
	fields: {
		title: {
			type: 'string'
		},
		description: {
			type: 'string'
		}
	},
	methods: {
		classes() { return Classes.find({clientId: this._id}) }
	}
});
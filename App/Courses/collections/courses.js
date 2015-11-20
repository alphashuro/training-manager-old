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
		},
		maxStudents: {
			type: 'number'
		}
	},
	methods: {
		classes() { return Classes.find({courseId: this._id}) },
		duration() { 
			let classes = this.classes().fetch();
			let durations = classes.map(c => c.duration);
			let total = durations.reduce((m, num) => { return m+num }, 0); 
			return total;
		},
		price() { 
			let classes = this.classes().fetch();
			let prices = classes.map(c => c.price);
			let total = prices.reduce((m, num) => { return m+num }, 0); 
	  	return total;
  	}
	}
});
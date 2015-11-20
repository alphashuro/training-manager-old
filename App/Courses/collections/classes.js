Classes = new Mongo.Collection('classes');

Class = Astro.Class({
	name: 'Class',
	collection: Classes,
	fields: {
		title : {
			type: 'string'
		},
		description : {
			type: 'string'
		},
		duration : {
			type: 'number'
		},
		price : {
			type: 'number'
		},
		courseId : {
			type: 'string'
		}
	}
});
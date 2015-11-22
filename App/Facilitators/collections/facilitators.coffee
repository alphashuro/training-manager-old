@Facilitators = new Mongo.Collection 'facilitators'
Ground.Collection Facilitators

@Facilitator = Astro.Class
	name: 'Facilitator'
	collection: Facilitators
	fields: ['name', 'email', 'phone']
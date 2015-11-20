Facilitators = new Mongo.Collection('facilitators');

Facilitator = Astro.Class({
	name: 'Facilitator',
	collection: Facilitators,
	fields: ['name', 'email', 'phone']
})
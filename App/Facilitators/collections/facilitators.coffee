@Facilitators = new Mongo.Collection 'facilitators'
App.Collections.Facilitators = Facilitators
Ground.Collection App.Collections.Facilitators

@Facilitator = Astro.Class
	name: 'Facilitator'
	collection: Facilitators
	fields: ['name', 'email', 'phone']

App.Classes.Facilitator = Facilitator

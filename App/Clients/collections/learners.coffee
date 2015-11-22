@Learners = new Mongo.Collection 'learners'
Ground.Collection Learners

@Learner = Astro.Class
	name: 'Learner'
	collection: Learners
	fields: 
		name:
			type: 'string'
		phone:
			type: 'string'
		email:
			type: 'string'
		clientId:
			type: 'string'
	methods:
		client: -> Clients.findOne @clientId
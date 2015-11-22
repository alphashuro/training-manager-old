@Clients = new Mongo.Collection 'clients'
Ground.Collection Clients

@Client = Astro.Class
	name: 'Client'
	collection: Clients
	fields:
		name:
			type: 'string'
		address: 
			type: 'string'
		contact:
			type: 'string'
		phone:
			type: 'string'
		email:
			type: 'string'
	methods:
		learners: -> Learners.find clientId: @_id
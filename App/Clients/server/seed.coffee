chance = new Chance 'clients'

chance.mixin
	client: ->
		name: chance.capitalize chance.word()
		address: chance.address()
		contact: chance.name()
		email: chance.email()
		phone: chance.phone()
	learner: (id) ->
		clientIds = Clients.find().fetch().map (client) -> client._id
		clientId = id or chance.pick clientIds

		{
			name: chance.name()
			email: chance.email()
			phone: chance.phone()
			clientId
		}

create = (clients = 5, learners = 5) ->
	_.times clients, ->
		client = new Client chance.client()
		client.save()
		_.times learners, ->
			learner = new Learner chance.learner client._id
			learner.save()

reset = ->
	Learners.remove({})
	Clients.remove({})

Meteor.startup ->
	reset()
	create()
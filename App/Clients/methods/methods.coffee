Meteor.methods
	'create/client': (doc) ->
		client = new Client doc
		client.save()

	'remove/client': (id) ->
		Client.remove id

	'update/client': (id, doc) ->
		client = Client.findOne(id)
		client.set doc
		client.save()
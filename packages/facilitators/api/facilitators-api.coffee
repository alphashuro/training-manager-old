class FacilitatorsAPI
	getAll: (filter) ->
		unless filter
			filter = {}
		_.extend filter, roles: $in: ['facilitator']

		App.Collections.Users.find filter,
			transform: (doc) ->
				new Facilitator doc
	get: (id) ->
		App.Collections.Users.findOne id,
			transform: (doc) ->
				new Facilitator doc
	create: ({ email, name, phone, password }, cb) ->
		Meteor.call 'users/create/user', email, password, { name, phone }, 'facilitator', cb

	update: (id, { name, phone }, cb) ->
		f = App.Collections.Users.findOne id
		f.set { name, phone }, cb

	remove: (id, cb) ->
		f = App.Collections.Users.findOne id
		f.remove(cb)

App.API.facilitators = @API = new FacilitatorsAPI()

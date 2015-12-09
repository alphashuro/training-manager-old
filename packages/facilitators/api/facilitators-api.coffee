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
	create: (doc, cb) ->
		{ email, name, phone } = doc
		Meteor.call 'create/user',
		email,
		no ,
		{
			name
			phone
		},
		'facilitator',	(error) ->
			if error then throw error
		# Meteor.call 'create/facilitator', doc, (error) ->
		# 	if error then console.log error
		# 	cb? error
	update: (id, doc, cb) ->
		f = App.Collections.Users.findOne id
		f.set doc, cb
		# Meteor.call 'update/facilitator', id, doc, (error) ->
		# 	if error then console.log error
		# 	cb? error
	remove: (id, cb) ->
		f = App.Collections.Users.findOne id
		f.remove()
		# Meteor.call 'remove/facilitator', id, (error) ->
		# 	if error
		# 		App.Utils.notify 'Facilitator Removed', error
		# 	cb? error

App.API.facilitators = @API = new FacilitatorsAPI()

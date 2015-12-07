class FacilitatorsAPI
	getAll: () ->
		facilitators = Roles.getUsersInRole 'facilitator', '',
			transform: (doc) ->
				new Facilitator doc
		return facilitators
	get: (id) ->
		App.Collections.Users.findOne id,
			transform: (doc) ->
				new Facilitator doc
	create: (doc, cb) ->
		Meteor.call 'create/facilitator', doc, (error) ->
			if error then console.log error
			cb?(error)
	update: (id, doc, cb) ->
		Meteor.call 'update/facilitator', id, doc, (error) ->
			if error then console.log error
			cb?(error)

App.API.facilitators = @API = new FacilitatorsAPI()

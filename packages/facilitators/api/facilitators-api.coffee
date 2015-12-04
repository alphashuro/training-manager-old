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
	create: (doc) ->
		Meteor.call 'create/facilitator', doc, (error) ->
			if error then console.log error
	update: (id, doc) ->
		Meteor.call 'update/facilitator', id, doc, (error) ->
			if error then console.log error

App.API.facilitators = @API = new FacilitatorsAPI()

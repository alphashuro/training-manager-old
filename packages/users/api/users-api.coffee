class UsersAPI
	create: ({email, password, name}, roles, cb) ->
		Meteor.call 'users/create/user',
			email,
			password,
			{	name },
			roles,
			cb
	remove: (id, cb) ->
		Meteor.call 'users/remove/user', id, cb
	addRole: (id, role, cb) ->
		Meteor.call 'users/add/role', id, role, cb
	removeRole: (id, role, cb) ->
		Meteor.call 'users/remove/role', id, role, cb
	update: (id, doc, cb) ->
	get: (id) ->
		App.Collections.Users.findOne id
	getAll: (filter) ->
		unless filter
			filter = {}

		App.Collections.Users.find filter

	invite: (id, cb) ->
		Meteor.call 'users/invite/user', id, cb

App.API.users = new UsersAPI()

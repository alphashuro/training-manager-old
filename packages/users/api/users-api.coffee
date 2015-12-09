class UsersAPI
	create: (doc, roles, cb) ->
		{email, password, name} = doc
		Meteor.call 'users/create/user',
			email,
			password,
			{	name },
			roles,
			(error) ->
				cb? error
	remove: (id, cb) ->
		Meteor.call 'users/remove/user', id, (error) =>
			cb? error
	addRole: (id, role, cb) ->
		Meteor.call 'users/add/role', id, role, (error) =>
			cb? error
	removeRole: (id, role, cb) ->
		Meteor.call 'users/remove/role', id, role, (error) =>
			cb? error
	update: (id, doc, cb) ->
	get: (id) ->
		App.Collections.Users.findOne id
	getAll: (filter) ->
		unless filter
			filter = {}

		App.Collections.Users.find filter

	invite: (id, cb) ->
		Meteor.call 'users/invite/user', id, (error) => cb? error

App.API.users = new UsersAPI()

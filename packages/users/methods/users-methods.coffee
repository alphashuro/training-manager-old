Meteor.methods
	# creates a new user
	'users/create/user': (email, password, profile, role) ->
		# userId that will be used to add role
		userId

		if password
			# password was given
			userId = Accounts.createUser {
				email
				password
				profile
			}

		else
			# password isnt given, create the user and send invitation email
			userId = Accounts.createUser {
				email
				profile
			}

			Accounts.sendEnrollmentEmail userId

		if role then Roles.addUsersToRoles userId, role

	'users/remove/user': (id) ->
		user = App.Collections.Users.findOne id
		unless user.roles?.length > 0
			App.Collections.Users.remove id
		else
			throw new Meteor.Error 'A user cannot be deleted while there is a role asigned to them'

	'users/exists/user': (emailOrUsername) ->
		if not emailOrUsername
			throw new Meteor.Error 'no user given'
		( Accounts.findUserByEmail emailOrUsername or Accounts.findUserByUsername emailOrUsername ) ? yes : no

	'users/invite/user': (id) ->
		Accounts.sendEnrollmentEmail id

	'users/add/role': (userId, role) ->
		Roles.addUsersToRoles userId, role

	'users/remove/role': (userId, role) ->
		Roles.removeUsersFromRoles userId, role

Meteor.methods
	'exists/user': (emailOrUsername) ->
		if not emailOrUsername
			throw new Meteor.Error 'no user given'
		( Accounts.findUserByEmail emailOrUsername or Accounts.findUserByUsername emailOrUsername ) ? true : false;

	'create/user': (email, password, profile) ->
		Accounts.createUser {email, password, profile}

	'invite/user': (email, profile) ->
		console.log('user invites not implemented')

	'make/role': (userId, role) ->
		Roles.addUsersToRoles userId, role
	'unmake/role': (userId, role) ->
		Roles.removeUsersFromRoles userId, role

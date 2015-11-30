Meteor.methods
	'userExists': (emailOrUsername) ->
		if not emailOrUsername
			throw new Meteor.Error 'no user given'
		if ( Accounts.findUserByEmail emailOrUsername or Accounts.findUserByUsername emailOrUsername )
			return true
		else return false
	'make/admin': (id) -> Roles.addUsersToRoles id, 'admin'

Meteor.methods
	'make/admin': (id) -> Roles.addUsersToRoles id, 'admin'
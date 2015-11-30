admin =
	email: 'alphashuro@gmail.com'
	password: 'password'
	username: 'alphashuro'
	profile:
		name: 'Alpha'

if Meteor.isServer
	# check if our default admin user already exists
	alreadyExists = Accounts.findUserByEmail admin.email

	otherAdmins = Roles.getUsersInRole 'admin'

	# if default admin doesn't exist,
	# and there are no other admins,
	# (re)create the default admin user
	unless alreadyExists or otherAdmins.length
		Accounts.createUser admin

	adminUser = Accounts.findUserByEmail admin.email

	# if admin isn't in admin role, add him to admin role
	unless Roles.userIsInRole adminUser._id, 'admin'
		Roles.addUsersToRoles adminUser._id, 'admin'

admin =
	email: 'alphashuro@gmail.com'
	password: 'password'
	username: 'alphashuro'
	profile:
		name: 'Alpha'

if Meteor.isServer
	if !Accounts.findUserByEmail admin.email
		Accounts.createUser admin

	adminUser = Accounts.findUserByEmail admin.email

	Meteor.call 'make/admin', adminUser, adminUser._id
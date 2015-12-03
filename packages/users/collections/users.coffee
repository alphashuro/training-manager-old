@Users = Meteor.users
Ground.Collection Users
App.Collections.Users = Users

@UserProfile = Astro.Class
	name: 'UserProfile'
	fields: {
		name: 'string'
		pictureId: 'string'
	}
App.Classes.UserProfile = UserProfile

@User = Astro.Class
	name: "User"
	collection: App.Collections.Users
	fields:
		createdAt: 'date'
		default: -> new Date()
		emails:
			type: 'array'
			default: -> []
		profile:
			type: 'object'
			nested: 'UserProfile'
			default: -> {}
		roles:
			type: 'array'
			nested: 'string'
	methods:
		getRoles: -> @roles
		getFirstEmail: -> @emails[0].address
		getEmails: -> @emails.map (email) -> email.address
		getPicture: -> App.Collections.Images.findOne @profile.pictureId
		getName: -> @profile.name

		# invite user to set up their account via email
		invite: -> Meteor.call 'invite/user', @_id, (error) =>
			if error then console.log error

		# add a role to a user
		make: (role) ->
			Meteor.call 'make/role', @_id, role, (error) =>
				if error then console.log error
		# remove user from a role
		unmake: (role) -> 
			Meteor.call 'unmake/role', @_id, role, (error) =>
				if error then console.log error
		# check if user belongs to a role
		'is': (role) ->
			Roles.userIsInRole @_id, role

App.Classes.User = User

if Meteor.isServer
	App.Classes.User.extend
		fields:
			services: 'object'

@Images = new FS.Collection 'images',
	stores: [new FS.Store.GridFS 'images']

App.Collections.Images = Images
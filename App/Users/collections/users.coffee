@Users = Meteor.users
Ground.Collection Users

@UserProfile = Astro.Class
	name: 'UserProfile'
	fields: {
		name: 'string'
	}

@User = Astro.Class
	name: "User"
	collection: Users
	fields: 
		createdAt: 'date'
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
		getRoles: -> Roles.getRolesForUser @_id
		getFirstEmail: -> @emails[0].address
		getEmails: -> @emails.map (email) -> email.address

if Meteor.isServer
	User.extend
		fields:
			services: 'object'
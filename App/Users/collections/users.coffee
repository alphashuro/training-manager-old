@Users = Meteor.users
Ground.Collection Users

@UserProfile = Astro.Class
	name: 'UserProfile'
	fields: {
		name: 'string'
		pictureId: 'string'
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
		getPicture: -> Images.findOne @profile.pictureId

if Meteor.isServer
	User.extend
		fields:
			services: 'object'

@Images = new FS.Collection 'images', 
	stores: [new FS.Store.GridFS 'images']
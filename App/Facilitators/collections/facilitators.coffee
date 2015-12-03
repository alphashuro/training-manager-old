@Facilitators = new Mongo.Collection 'facilitators'
App.Collections.Facilitators = Facilitators
Ground.Collection App.Collections.Facilitators

@FacilitatorProfile = App.Classes.UserProfile.inherit
	name: 'FacilitatorProfile'
	fields: ['phone']

@Facilitator = App.Classes.User.inherit
	name: 'Facilitator'
	fields: 
		profile: 
			type: 'object'
			nested: 'FacilitatorProfile'
	methods:
		inviteUser: ->
			profile =
				name : @name
				phone : @phone
			Meteor.call 'invite/user', @email, (error) ->
				App.Utils.notify 'User invited', error

App.Classes.Facilitator = Facilitator

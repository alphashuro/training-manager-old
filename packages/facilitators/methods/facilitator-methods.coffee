Meteor.methods
	'create/facilitator': (doc) ->
		{ email, name, phone } = doc

		facilitator = new Facilitator
			emails: [
				{ address: email, verified: false }
			]
			profile:
				name
				phone
			roles: 'facilitator'

		facilitator.save()

	'update/facilitator': (id, doc) ->
		facilitator = Facilitator.findOne id

		facilitator.set doc

		facilitator.save()

Meteor.methods
	'create/facilitator': (doc) ->
		{ email, name, phone } = doc
		Meteor.call 'users/create/user',
		email,
		no ,
		{
			name
			phone
		},
		'facilitator',	(error) ->
			if error then throw error
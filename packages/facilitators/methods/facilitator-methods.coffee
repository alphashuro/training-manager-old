Meteor.methods
	'create/facilitator': ({ email, name, phone }) ->
		Meteor.call 'users/create/user',
		email,
		no ,
		{
			name
			phone
		},
		'facilitator',	(error) ->
			if error then throw error

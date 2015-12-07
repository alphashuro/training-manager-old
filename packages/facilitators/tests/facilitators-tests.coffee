Tinytest.add 'Facilitator API exists', (test) ->
	test.isNotUndefined App.API.facilitators

Tinytest.add 'FacilitatorsAPI.getAll', (test) ->
	# Roles =
	# 	getUsersInRole: (role, group, options) ->
	# 		test.equal role, 'facilitatorc'
	# 		{
	# 			fetch: ->
	# 				[
	# 					{ _id: '1' }
	# 				]
	# 		}

	# cursor =  API.getAll()
	# facilitators = cursor.fetch()

	# test.length facilitators, 1
	# test.equal facilitators, [ { _id: '1' } ]

Tinytest.add 'FacilitatorsAPI.get', (test) ->
	App.Collections.Users =
		findOne: (id) ->
			test.equal id, '1'
			return {_id: '1'}

	facilitator = App.API.facilitators.get('1')

	test.equal facilitator, {_id: '1'}

Tinytest.add 'FacilitatorsAPI.create', (test) ->
	Meteor.call = (method, doc, cb) ->
		test.equal method, 'create/facilitator'
		test.equal doc, profile: name: 'facilitator'

	App.API.facilitators.create profile: name: 'facilitator'

Tinytest.add 'FacilitatorsAPI.update', (test) ->
	Meteor.call = (method, id, doc, cb) ->
		test.equal method, 'update/facilitator'
		test.equal id, '1'
		test.equal doc, {name: 'f'}

	App.API.facilitators.update '1', {name: 'f'}

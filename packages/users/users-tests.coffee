Tinytest.add 'User Class', (test) ->
  test.isNotUndefined App.Classes.User

  user = new App.Classes.User()
  test.isNotUndefined user._id

Tinytest.add 'User.getRoles()', (test) ->
	user = new App.Classes.User roles: ['role']

	test.isNotUndefined user.getRoles()
	test.length user.getRoles(), 1

	user.push 'roles', 'role2'
	test.length user.getRoles(), 2

	roles = user.getRoles()

	test.equal roles[0], 'role'
	test.equal roles[1], 'role2'

Tinytest.add 'User.getFirstEmail', (test) ->
	user = new App.Classes.User emails: [ { address: 'a@b.c' } ]
	test.equal user.getFirstEmail(), 'a@b.c'

Tinytest.add 'User.getEmails', (test) ->
	user = new App.Classes.User emails: [ 
		{address: 'a@b.c'} 
		{address: 'b@b.c'} 
		{address: 'c@b.c'} 
	];
	
	test.equal user.getEmails(), ['a@b.c', 'b@b.c', 'c@b.c']

Tinytest.add 'User.getPicture', (test) ->
	App.Collections.Images = 
		findOne: (id) ->
			test.equal id, '1'
			return 'picture'
	user = new App.Classes.User profile: pictureId: '1'
	picture = user.getPicture()

	test.equal picture, 'picture'

Tinytest.add 'User.getName', (test) ->
	user = new App.Classes.User profile: name: 'test'

	test.equal user.getName(), 'test'

Tinytest.add 'User.invite', (test) ->
	Meteor.call = (method, id, cb) ->
		test.equal method, 'invite/user'
		test.equal id, '1'

	user = new App.Classes.User 
		_id: '1'
		emails: [ { address: 'a@b.c' } ]

	user.invite()

Tinytest.add 'User.unmake', (test) ->
	Meteor.call = (method, id, role, cb) ->
		test.equal method, 'unmake/role'
		test.equal id, '1'
		test.equal role, 'testRole'

	user = new App.Classes.User
		_id: '1'

	user.unmake 'testRole'

Tinytest.add 'User.make', (test) ->
	Meteor.call = (method, id, role, cb) ->
		test.equal method, 'make/role'
		test.equal id, '1'
		test.equal role, 'testRole'

	user = new App.Classes.User
		_id: '1'

	user.make 'testRole'

Tinytest.add 'User.is', (test) ->
	Roles = {}
	Roles.userIsInRole = (id, role) ->
		test.equal id, '1'
		test.equal role, 'testRole'

	user = new App.Classes.User
		_id: '1'

	user.is 'testRole'
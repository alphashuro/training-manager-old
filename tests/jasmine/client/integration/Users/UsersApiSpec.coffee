describe 'The User API', ->
	it 'Should create users', (done) ->
		user =
			email: 'test@users.com'
			password: 'password'
			name: 'test user'

		App.API.users.create user, [] , (error) =>
			if error
				console.log error

			cursor = App.API.users.getAll "emails.address": "test@users.com"
			users = cursor.fetch()
			u = users[0]

			expect(cursor.count()).toBe 1
			expect(u.emails[0].address).toEqual 'test@users.com'
			expect(u.profile.name).toEqual 'test user'

			done()

	xit 'Should remove users', ->
	xit 'Should add a role to a user', ->
	xit 'Should remove a role from a user', ->
	xit 'Should update a user\'s profile', ->
	xit 'Should get a user object', ->
	xit 'Should get a cursor of all users', ->

describe 'Facilitators API', ->

	it 'Should create a facilitator', (done) ->
		fac =
			email: 'test@facilitators.com'
			password: 'pass'
			name: 'test facilitator'
			phone: '1234'

		App.API.facilitators.create fac, (error) ->
			cursor = App.API.facilitators.getAll "emails.address": 'test@facilitators.com'
			facilitators = cursor.fetch()
			f = facilitators[0]

			expect(cursor.count()).toBe 1
			expect(f.emails[0].address).toBe 'test@facilitators.com'
			expect(f.profile).toBeDefined()
			# expect(f.profile.name).toEqual 'test facilitator'
			# expect(f.profile.phone).toEqual '1234'

			done()

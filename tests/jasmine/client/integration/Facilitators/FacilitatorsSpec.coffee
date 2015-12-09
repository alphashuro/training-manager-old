describe 'Facilitators', ->
	beforeAll (done)->
		Meteor.loginWithPassword 'alphashuro@gmail.com', 'password', (error) ->
			unless error
				done()

	describe 'Add Facilitator', ->
		beforeEach ->
			FlowRouter.go '/facilitators/add'

		#returns an element found inside the div, selected by the sel parameter
		el = (sel) ->
			$(sel)[0]

		xit 'Should be able to create a new facilitator', ->
			inputs =
				name : el '[name=name]'
				phone: el '[name=phone]'
				email: el '[name=email]'
				password: el '[name=password]'

			inputs.name.value = 'Test Facilitator'
			inputs.email.value = 'test@domain.co.za'
			inputs.phone.value = '0123456789'
			inputs.password.value = 'password'

			button = el '#create-facilitator'
			button.click()

			cursor = App.Collections.Users.find
				"emails.address": "test@domain.co.za"
			facilitators = cursor.fetch()
			f = facilitators[0]

			expect(cursor.count()).toBe(1)

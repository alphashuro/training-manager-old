describe 'Edit Facilitator Form', ->
	div = undefined
	facilitator = undefined

	beforeEach ->
		div = document.createElement 'DIV'
		facilitator =
			_id : '1'
			profile :
				name : 'Test Facilitator'
				phone : '0123456789'
			emails : [ { address: 'facilitator@domain.com' } ]
		Riot.mount div, 'edit-facilitator-form', { facilitator }

	#returns an element found inside the div, selected by the sel parameter
	el = (sel) ->
		$(div).find(sel)[0]

	it 'Should have inputs for name, email, and phone, and values should be properties of the object passed to the tag', ->
		inputs = {
			email : el 'input[name=email]'
			name : el 'input[name=name]'
			phone : el 'input[name=phone]'
		}

		for name, input of inputs
			expect(input).toBeDefined()
			switch name
				when 'name'
					expect(input.value).toEqual facilitator.profile.name
				when 'email'
					expect(input.value).toEqual facilitator.emails[0].address
				when 'phone'
					expect(input.value).toEqual facilitator.profile.phone

	it 'Should have a disabled email input', ->
		email = el 'input[name=email]'

		expect(email.disabled).toBeTruthy()

	it 'Should call update on API when save button is clicked', ->
		spyOn App.API.facilitators, 'update'

		inputs = {
			email : el 'input[name=email]'
			name : el 'input[name=name]'
			phone : el 'input[name=phone]'
		}

		inputs.name.value = 'Test Facilitator Changed'
		inputs.phone.value = '9876543210'

		button = el 'button#update-facilitator'
		button.click()

		expect(App.API.facilitators.update).toHaveBeenCalledWith '1',	{
			name: 'Test Facilitator Changed'
			phone: '9876543210'
		}, jasmine.any Function

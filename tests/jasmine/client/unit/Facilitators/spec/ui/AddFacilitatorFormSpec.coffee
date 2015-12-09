describe 'Add Facilitator Form', ->
	div = undefined

	beforeEach ->
		div = document.createElement 'DIV'
		Riot.mount div, 'add-facilitator-form'

	#returns an element found inside the div, selected by the sel parameter
	el = (sel) ->
		$(div).find(sel)[0]

	it 'Should have inputs for name, email, password, and phone', ->
		inputs = {
			email : el 'input[name=email]'
			name : el 'input[name=name]'
			phone : el 'input[name=phone]'
			password : el 'input[name=password]'
		}

		expect(input).toBeDefined()	for name, input of inputs

	it 'Should call create on API when save button is clicked', ->
		spyOn App.API.facilitators, 'create'

		inputs = {
			email : el 'input[name=email]'
			name : el 'input[name=name]'
			phone : el 'input[name=phone]'
			password : el 'input[name=password]'			
		}

		inputs.name.value = 'Test Facilitator'
		inputs.email.value = 'facilitator@domain.com'
		inputs.phone.value = '0123456789'
		inputs.password.value = 'password'

		button = el 'button#create-facilitator'
		button.click()

		expect(App.API.facilitators.create).toHaveBeenCalledWith {
			name: 'Test Facilitator'
			email: 'facilitator@domain.com'
			phone: '0123456789'
			password: 'password'
			
		}, jasmine.any Function

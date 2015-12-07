describe 'Facilitators Form', ->
	div = undefined
	beforeEach ->
		div = document.createElement 'DIV'

	it 'Should call create if no facilitator is passed in opts', ->
		spyOn App.API.facilitators, 'create'

		test = 
			name = 'test facilitator'
			email = 'test@domain.com'
			phone = '0123456789'

		Riot.mount div, 'facilitator-form'

		nameInput = $(div).find('input[name=name]')[0]
		emailInput = $(div).find('input[name=email]')[0]
		phoneInput = $(div).find('input[name=phone]')[0]

		nameInput.value = test.name
		emailInput.value = test.email
		phoneInput.value = test.phone
	
		form = $(div).find('form')[0]
		form.submit()

		expect(App.API.facilitators.create).not.toHaveBeenCalledWith { ...test }
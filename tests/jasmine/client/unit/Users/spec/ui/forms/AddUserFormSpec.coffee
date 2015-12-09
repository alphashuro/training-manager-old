describe 'Add User Form Tag', ->
	div = undefined

	beforeEach ->
		div = document.createElement 'DIV'
		Riot.mount div, 'add-user-form'

	#returns an element found inside the div, selected by the sel parameter
	el = (sel) ->
		$(div).find(sel)[0]

	it 'Should have input for name and email and password', ->
		inputs = {
			email : el('input[name=email]')
			name : el('input[name=name]')
			password : el('input[name=password]')
		}

		expect(input).toBeDefined()	for name, input of inputs

	it 'Should call create on API when form is submitted', ->
		spyOn App.API.users, 'create'

		inputs = {
			email : el('input[name=email]')
			name : el('input[name=name]')
			password : el('input[name=password]')
		}

		inputs.name.value = 'Test User'
		inputs.email.value = 'user@domain.com'
		inputs.password.value = 'password'

		button = $(div).find('button#create-user')[0]
		button.click()

		expect(App.API.users.create).toHaveBeenCalledWith {
			email : 'user@domain.com'
			name : 'Test User'
			password : 'password'
		}, []

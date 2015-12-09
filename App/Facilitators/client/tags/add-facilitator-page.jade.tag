add-facilitator-page
	.ui.center.aligned.header
		h2 New facilitator
	add-facilitator-form

add-facilitator-form
	form.ui.form
		.field
			label Name
			input(type="text" name="name" placeholder="Name" )

		.field
			label Email
			input(type="text" name="email" placeholder="Email" )

		.field
			label Password
			input(type="password" name="password" placeholder="Password")
			
		.field
			label Phone
			input(type="text" name="phone" placeholder="Phone" )

		button#create-facilitator.ui.button(type='button' onclick='{save}') Save

	script(type='coffee').
		@save = ->
			name = @name.value
			email = @email.value
			phone = @phone.value
			password = @password.value
			
			App.API.facilitators.create {
				name
				email
				phone
				password
			}, (error) ->
				App.Utils.notify 'Facilitator Created', error

facilitator-form
	form.ui.form(onsubmit='{save}')

		.field
			label Name
			input(type="text" name="name" placeholder="Name" value='{opts.facilitator.get("profile.name")}')

		.field
			label Email
			input(type="text" name="email" placeholder="Email" value='{opts.facilitator.getFirstEmail()}')

		.field
			label Phone
			input(type="text" name="phone" placeholder="Phone" value='{opts.facilitator.get("profile.phone")}' )

		button.ui.button Save

	script(type='coffee').
		@on 'mount', ->
			if opts.facilitator
				@email.disabled = true
				
		@save = (e) ->
			e.preventDefault()

			doc =
				email: @email.value
				name: @name.value
				phone: @phone.value
			
			if !opts.facilitator			
				App.API.facilitators.create doc

			else 
				App.API.facilitators.update doc

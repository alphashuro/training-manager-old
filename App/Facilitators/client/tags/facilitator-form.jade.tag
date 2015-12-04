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
			profile = 
				name: @name.value
				phone: @phone.value
			
			if !opts.facilitator
				email = @email.value
			
				Meteor.call 'create/facilitator', email, profile

			else 
				@opts.facilitator.set 'profile', profile 
				@opts.facilitator.save (error) ->
					if error then console.log error
					else console.log 'Facilitator saved'

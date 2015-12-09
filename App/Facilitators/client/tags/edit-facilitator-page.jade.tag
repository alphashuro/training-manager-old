edit-facilitator-page
	.ui.center.aligned.header
		h1 Edit Facilitator
	edit-facilitator-form( facilitator="{data.facilitator}" )

	script( type='coffee' ).
		@getMeteorData = ->
			facilitator: App.API.facilitators.get @opts.facilitator_id
		@mixin 'RiotMeteorData'

edit-facilitator-form
	form.ui.form
		.field
			label Name
			input(type="text" name="name" placeholder="Name" value='{opts.facilitator.profile.name}')

		.field
			label Email
			input(type="text" name="email" placeholder="Email" value='{opts.facilitator.emails[0].address}' disabled)

		.field
			label Phone
			input(type="text" name="phone" placeholder="Phone" value='{opts.facilitator.profile.phone}')

		button#update-facilitator.ui.button(type='button' onclick='{save}') Save

		script(type='coffee').
			@save = ->
				id = @opts.facilitator._id
				name = @name.value
				phone = @phone.value
				
				App.API.facilitators.update id, { 
					name 
					phone 
				}, (error) ->
					App.Utils.notify 'Facilitator Updates Saved', error

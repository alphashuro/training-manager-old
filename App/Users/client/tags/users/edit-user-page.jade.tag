edit-user-page
	.ui.center.aligned.header Edit User
	.ui.segment
		edit-user-form(user="{data.user}")

	script(type='coffee').
		@getMeteorData = ->
			user: App.API.users.get @opts.user_id
		@mixin 'RiotMeteorData'

edit-user-form
	form.ui.form
		.field
			label Email
			input( name="email" value="{email}" disabled )

		.field
			label Name
			input( name="name" value="{name}" )
			
		.field
			button.ui.button( type='button' onclick="{invite}" ) Send password link 

		.field
			label Roles
			br
			button.ui.button(
				type="button"
				onclick="{addRole.bind(this, 'facilitator')}"
				if="{! is('facilitator') }"
			) Make Facilitator
			button.ui.button(
				type="button"
				onclick="{addRole.bind(this, 'admin')}"
				if="{! is('admin') }"
			) Make Admin

			ul
				li( each="{ role in roles() }" )
					.ui.basic.button( onclick="{parent.removeRole.bind(this, role)}" 
					) { role } X

		button.ui.button( type="button" onclick="{save}" ) Save

	script(type='coffee').
		@email = opts.user.emails[0].address
		@name = opts.user.profile.name
		@roles = -> opts.user.getRoles()
		
		@addRole = (role) -> App.API.users.addRole opts.user._id, role, (error) =>
			App.Utils.notify "role #{role} added to user", error
		@removeRole = (role) -> App.API.users.removeRole opts.user._id, role, (error) =>
			App.Utils.notify "role #{role} removed from user", error
		@is = (role) -> opts.user.is role
		
		@invite = -> App.API.users.invite opts.user._id

		@save = ->
			name = @name.value

			App.API.users.update {
				name
			}

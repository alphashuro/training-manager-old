add-user-page
	.ui.center.aligned.header Add User
	.ui.segment
		add-user-form

add-user-form
	form.ui.form(onsubmit="{save}")
		p Name
			input(name="name")

		p Email
			input(name="email")
			
		p Password
			input(name="password" type="password")

		p Roles

		button#create-user.ui.button(type='button' onclick='{save}') Create
		button.ui.button(type='reset') Reset

	script(type="coffee").
		@on 'mount', ->
			@roles = []

		@save = (e) ->
			e.preventDefault()

			name = @name.value
			email = @email.value
			password = @password.value
			roles = @roles

			App.API.users.create {
				name
				email
				password
			}, roles, (error) ->
				unless error 
					FlowRouter.go '/users'

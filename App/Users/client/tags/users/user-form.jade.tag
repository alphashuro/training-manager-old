user-form
	form.ui.form(onsubmit="{save}")
		p Email
			input(value='{opts.user.getFirstEmail()}' disabled )

		p Name
			input( name='name' value='{opts.user.profile.name}' )
	
		p Roles
			button.ui.button(
				type='button' 
				onclick='{ makeFacilitator }' 
				if='{ !opts.user.is("facilitator") }'
			) Make Facilitator
			button.ui.button(
				type='button' 
				onclick='{ makeAdmin }' 
				if='{ !opts.user.is("admin") }'
			) Make Admin
			ul
				li(each="{ role in opts.user.getRoles() }") 
					.ui.basic.button(
						onclick='{ parent.unmake }'
					) { role } X

		button.ui.button Save
	
	script(type='coffee').
		@on 'mount', ->
			unless @opts.user
				@opts.user = new User()

		@save = (e) ->
			e.preventDefault()

			@opts.user.set
				'profile.name': @name.value

			@opts.user.save()

		@makeFacilitator = ->
			@opts.user.make('facilitator')
	
		@makeAdmin = ->
			@opts.user.make('admin')

		@unmake = (e) ->
			role = e.item.role
			@parent.opts.user.unmake role
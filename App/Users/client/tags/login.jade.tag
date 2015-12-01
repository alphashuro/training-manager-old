login
	.ui.middle.center.aligned.grid
		.column
			h2.ui.image.header
				//- img.image
				.content Login to your account
			form.ui.large.form.login(onsubmit="{login}")
				.ui.stacked.segment

					.field
						.ui.left.icon.input
							i.user.icon
							input( type="text" name="email" placeholder="Email address" )

					.field
						.ui.left.icon.input
							i( class="lock icon" )
							input( type="password" name="password" placeholder="Password" )

				button( id='login' class='ui fluid large teal submit button login' onclick="{ login }" ) Login

				div( class="ui error message" )

	style( type="stylus" ).
		body>#riot-root
			height 100%

			.grid
				height 100%
			  //- display flex
			  //- justify-content center
			  //- flex-direction row
			  //- align-items center

				.column
					max-width 450px

	script( type='coffee' ).
		@login = (e) ->
			e.preventDefault()
			App.Services.UserClient.login @email.value, @password.value, (error) =>
				unless error
					FlowRouter.go '/'

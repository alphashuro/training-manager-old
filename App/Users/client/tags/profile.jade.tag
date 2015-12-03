profile-page
	.ui.center.aligned.header User Profile
	.ui.segment
		profile-form(user="{data.user}")

	script(type="coffee").
		@getMeteorData = ->
			user = Meteor.user()

			{ user }

		@mixin 'RiotMeteorData'

profile-form
	form(onsubmit="{save}")
		p Email
			input(value='{opts.user.getFirstEmail()}' disabled )

		p Name
			input( name='name' value='{opts.user.profile.name}' )

		p Photo
			img.ui.medium.circular.image( alt='Profile Picture' src='{ opts.user.getPicture().url() }' style='height: 300px; width: 300px;' )
			br
			input( name='profilePic' type='file' onchange='{changed}' )

		p Roles
			ul
				li(each="{ role in opts.user.getRoles() }") { role }

		button.ui.button Save

	script(type="coffee").
		@save = (e) ->
			e.preventDefault()

			@opts.user.set
				'profile.name': @name.value

			@opts.user.save()

		@changed = (e) ->
			switch e.target.name
				when 'profilePic'
					profilePic = @profilePic.files[0]
					Images.insert profilePic, (err, file) =>
						if err
							console.log err
						else
							Images.remove @opts.user.profile.pictureId
							@opts.user.set
								"profile.pictureId": file._id

edit-facilitator-page
	.ui.center.aligned.header
		h1 Edit Facilitator
	facilitator-form( facilitator="{data.facilitator}" )

	script( type='coffee' ).
		@getMeteorData = ->
			facilitator: App.API.facilitators.get @opts.facilitator_id
		@mixin 'RiotMeteorData'

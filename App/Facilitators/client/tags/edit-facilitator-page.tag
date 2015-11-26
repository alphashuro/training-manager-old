<edit-facilitator-page>
	<h1>Edit Facilitator</h1>
	<facilitator-form facilitator={data.facilitator}></facilitator-form>

	<script type='coffee'>
		@getMeteorData = ->
			facilitator: Facilitators.findOne @opts.facilitator_id

		@mixin 'RiotMeteorData'
	</script>

</edit-facilitator-page>
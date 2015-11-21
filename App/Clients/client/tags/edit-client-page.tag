<edit-client-page>
	<h1>Edit Client</h1>
	<client-form client="{data.client}"></client-form>

	<br>
	<learners-table client="{data.client}"></learners-table>

	<script type="coffee">
		@getMeteorData = ->
			client: Clients.findOne @opts.client_id

		@mixin 'RiotMeteorData'
	</script>
</edit-client-page>
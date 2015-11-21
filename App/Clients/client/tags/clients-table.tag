<clients-table>
	<table class="ui table">
		<thead>
			<tr>
				<th>Name</th>
				<th>Address</th>
				<th>Contact</th>
				<th>Phone</th>
				<th>Email</th>
				<th>No of learners</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<tr each="{data.clients}">
				<td>{name}</td>
				<td>{address}</td>
				<td>{contact}</td>
				<td>{phone}</td>
				<td>{email}</td>
				<td>{learners().count()}</td>
				<td>
					<a href="/clients/{_id}" class="ui primary button">Details</a>
					<button class="ui button">Delete</button>
				</td>
			</tr>
		</tbody>
	</table>

	<script type='coffee'>
		@getMeteorData = ->
			clients: Clients.find().fetch()

		@mixin 'RiotMeteorData'
	</script>
</clients-table>
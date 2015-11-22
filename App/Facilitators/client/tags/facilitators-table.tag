<facilitators-table>
	<table class="ui table">
		<thead>
			<tr>
				<th>Name</th>
				<th>Phone</th>
				<th>Email</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<tr each={ data.facilitators }>
				<td>{name}</td>
				<td>{phone}</td>
				<td>{email}</td>
				<td>
					<a href="/facilitators/{_id}" class="ui primary button">Details</a>
					<button class="ui button" onclick='{parent.delete}'>Delete</button>
				</td>
			</tr>
		</tbody>
	</table>
	
	<script>
	'use strict';
	getMeteorData() {
		return { 
			facilitators: Facilitators.find({}).fetch()
		}
	}
	this.mixin('RiotMeteorData');
	</script>
	<script type="coffee">
		@delete = (e) -> e.item.remove()
	</script>
</facilitators-table>
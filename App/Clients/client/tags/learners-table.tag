<learners-table>
	<table class="ui celled table">
		<thead>
			<tr>
				<th>Name</th>
				<th>Phone</th>
				<th>Email</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<div class="ui input">
						<input 
							type="text" 
							name="name" 
							placeholder="Name"/>
					</div>
				</td>
				<td>
					<div class="ui input">
						<input 
							type="text" 
							name="phone" 
							placeholder="Phone"/>
					</div>
				</td>
				<td>
					<div class="ui input">
						<input 
							type="text" 
							name="email" 
							placeholder="Email"/>
					</div>
				</td>
				<td>
					<button 
						class='ui button'
						type='button'>Add</button>
				</td>
			</tr>
			<tr each="{data.learners}">
				<td>{name}</td>
				<td>{phone}</td>
				<td>{email}</td>
				<td>
					<button class="ui button" onclick='{parent.delete}'>Delete</button>
				</td>
			</tr>
		</tbody>
	</table>

	<script type="coffee">
		@getMeteorData = ->
			learners: this.opts.client?.learners().fetch()

		@mixin 'RiotMeteorData'

		@delete = (e) -> e.item.remove()
	</script>
</learners-table>
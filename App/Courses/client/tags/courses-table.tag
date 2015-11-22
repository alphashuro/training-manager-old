<courses-table>
	<table class="ui table">
		<thead>
			<tr>
				<th>Title</th>
				<th>Description</th>
				<th>Max Students</th>
				<th>No of classes</th>
				<th>Duration</th>
				<th>Price</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<tr each="{data.courses}">
				<td>{title}</td>
				<td>{description}</td>
				<td>{maxStudents}</td>
				<td>{classes().count()}</td>
				<td>{duration()} hrs</td>
				<td>R {price()}</td>
				<td>
					<a href="/courses/{_id}" class="ui primary button">Details</a>
					<button class="ui button" onclick='{parent.delete}'>Delete</button>
				</td>
			</tr>
		</tbody>
	</table>

	<script type='coffee'>	
		@getMeteorData = ->
			courses: Courses.find().fetch()

		@mixin('RiotMeteorData')

		@delete = (e) -> e.item.remove()
	</script>
</courses-table>
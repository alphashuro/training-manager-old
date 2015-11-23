<classes-table>
	<table class="ui celled table">
		<thead>
			<tr>
				<th>Title</th>
				<th>Description</th>
				<th>Duration</th>
				<th>Price</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<div class="ui input">
					<input type="text" name='title' placeholder='Title' />
					</div>
				</td>
				<td>
					<div class="ui input">
					<input type="text" name='description' placeholder='Description' />
					</div>
				</td>
				<td>
					<div class="ui input">
					<input type="text" name="duration" placeholder="Duration"/>
					</div>
				</td>
				<td>
					<div class="ui input">
					<input type="text" name="price" placeholder="Price"/>
					</div>
				</td>
				<td>
					<button class='ui button' type="button" onclick='{add}'>Add</button>
				</td>
			</tr>
			<tr each="{data.classes}">
				<td>{title}</td>
				<td>{description}</td>
				<td>{duration}</td>
				<td>{price}</td>
				<td>
					<button class='ui button' onclick='{parent.delete}'>Delete</button>
				</td>
			</tr>
		</tbody>
	</table>

	<script type='coffee'>
		@getMeteorData = ->
			classes: @opts.course?.classes().fetch()
		@mixin 'RiotMeteorData'

		@delete = (e) -> e.item.remove()
		@add = ->
			c = new Class
				title: @title.value
				description: @description.value
				duration: @duration.value
				price: @price.value
				courseId: @opts.course._id

			c.save()
	</script>
</classes-table>
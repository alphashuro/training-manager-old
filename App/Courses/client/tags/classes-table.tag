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
					<button class='ui button' type="button">Add</button>
				</td>
			</tr>
			<tr each="{data.classes}">
				<td>{title}</td>
				<td>{description}</td>
				<td>{duration}</td>
				<td>{price}</td>
				<td>
					<button class='ui button'>Delete</button>
				</td>
			</tr>
		</tbody>
	</table>

	<script>
	'use strict';
	getMeteorData() {
		return {
			classes: this.opts.course.classes().fetch()
		}
	}
	this.mixin('RiotMeteorData');
	</script>
</classes-table>
<client-form>
	<form class="ui form">
		<div class="field">
						<label>Name</label>
						<input type="text" name='name' placeholder='Name' value={opts.client.name} />
					</div>
					<div class="field">
						<label>Address</label>
						<input type="text" name='address' placeholder='Address' value={opts.client.address} />
					</div>
					<div class="field">
						<label>Contact</label>
						<input type="text" name='contact' placeholder='Contact' value={opts.client.contact} />
					</div>
					<div class="field">
						<label>Email</label>
						<input type="text" name='email' placeholder='Email' value={opts.client.email} />
					</div>
					<div class="field">
						<label>Phone</label>
						<input type="text" name='phone' placeholder='Phone' value={opts.client.phone} />
					</div>
					<button class='ui button'>Save</button>
	</form>

	<script type="coffee">
		@on 'mount', ->
			console.log @opts
			unless @opts.client
				@opts.client = new Client();
	</script>
</client-form>
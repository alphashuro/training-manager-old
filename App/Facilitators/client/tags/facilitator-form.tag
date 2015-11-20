<facilitator-form>
	<form class="ui form">
		<div class="field">
			<label>Name</label>
			<input type="text" name placeholder="Name" value={opts.facilitator.name}>
		</div>
		<div class="field">
			<label>Email</label>
			<input type="text" name="email" placeholder="Email" value={opts.facilitator.email}>
		</div>
		<div class="field">
			<label>Phone</label>
			<input type="text" name="phone" placeholder="Phone" value={opts.facilitator.phone}>
		</div>

		<button class="ui button">Save</button>
	</form>

	<script>
	this.on('mount', () => {
		if(!this.opts.facilitator)
			this.opts.facilitator = new Facilitator();
	});
	</script>
</facilitator-form>
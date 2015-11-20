<facilitator-form>
	<form class="ui form">
		<div class="field">
			<label>Name</label>
			<input type="text" name placeholder="Name" value={facilitator.name}>
		</div>
		<div class="field">
			<label>Email</label>
			<input type="email" name="email" placeholder="Email" value={facilitator.email}>
		</div>
		<div class="field">
			<label>Phone</label>
			<input type="text" name="phone" placeholder="Phone" value={facilitator.phone}>
		</div>

		<button class="ui button">Save</button>
	</form>

	this.on('mount', () => {
		if(this.opts.facilitator)
			this.facilitator = this.opts.facilitator; 
		else
			this.facilitator = new Facilitator();
	});
</facilitator-form>
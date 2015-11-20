<edit-facilitator-page>
	<h1>Edit Facilitator</h1>
	<facilitator-form facilitator={data.facilitator}></facilitator-form>

	<script>
	'use strict';
	let id = this.opts.facilitator_id;

	getMeteorData() {
		return {
			facilitator: Facilitators.findOne(id)
		}
	}

	this.mixin('RiotMeteorData');
	</script>

</edit-facilitator-page>
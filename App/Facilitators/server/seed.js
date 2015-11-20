const chance = new Chance('facilitators');

chance.mixin({
	facilitator() {
		let name = chance.name();
		let email = chance.email();
		let phone = chance.phone();

		return {
			name, email, phone
		}
	}
});

const create = function(count = 5) {
	_.times(count, () => {
		let facilitator = new Facilitator(chance.facilitator());
		facilitator.save();
	}); 
}

const reset = function() {
	Facilitators.remove({});
}

Meteor.startup(function() {
	reset();
	create();
});
Clients = new Mongo.Collection('clients');

Client = Astro.Class({
	name: 'Client',
	collection: Clients,
	fields: {
		name: {
			type: 'string'
		},
		address: {
			type: 'string'
		},
		contact: {
			type: 'string'
		},
		phone: {
			type: 'string'
		},
		email: {
			type: 'string'
		}
	},
	methods: {
		learners() {
			return Learners.find({clientId: this._id});
		}
	}
});
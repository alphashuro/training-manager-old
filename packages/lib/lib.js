var App = {
  Constants: {},
  // Small reusable utilities
  Utils: {},
  // Meteor Mongo Collections and associated classes
  Collections: {},
  Classes: {},
  // Domain specific logic
  Services: {},
  Subscriptions: {},
  Publications: {},
  API: {},
	publicRoutes: FlowRouter.group({ name: 'public' }),
	privateRoutes: FlowRouter.group({
		name: 'private',
		triggersEnter: [
			function() {
				if(!Meteor.loggingIn() || !Meteor.userId()) {
					let route = FlowRouter.current();

					if(!route.route.name === 'login') {
						FlowRouter.go('login');
					}
				}
			}
		]
	})
}

var global = this;
global.App = App;

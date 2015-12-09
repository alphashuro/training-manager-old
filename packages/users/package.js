Package.describe({
  name: 'training:users',
  version: '0.0.1',
  // Brief, one-line summary of the package.
  summary: '',
  // URL to the Git repository containing the source code for this package.
  git: '',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.2.1');
  api.use([
    'training:lib'
    ]);

	var files = {
		both: [
			'models/users-model.coffee',
			'api/users-api.coffee'
		],
		server: [
      'methods/users-methods.coffee',
			'publications/publish-users.coffee'
		],
		client: [

		]
	};

	api.addFiles(files.both);
	api.addFiles(files.server, 'server');
	api.addFiles(files.client, 'client')
  api.addFiles();
});

Package.onTest(function(api) {
  api.use(['ecmascript','coffeescript']);
  api.use('tinytest');
  api.use('training:users');
  api.addFiles('tests/users-class-tests.coffee');
});

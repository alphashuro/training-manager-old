Package.describe({
  name: 'training:facilitators',
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

	var packages = {
		client: [],
		server: [],
		shared: [
			'training:lib',
			'training:users'
		]
	}

	var files = {
		client: [],
		server: [],
		shared: [
			'api/facilitators-api.coffee',
			'models/facilitators-model.coffee'
		]
	}

  api.use(packages.shared);
  api.use(packages.client, 'client');
  api.use(packages.server, 'server');

  api.addFiles(files.shared);
  api.addFiles(files.client, 'client');
  api.addFiles(files.server, 'server');
});

Package.onTest(function(api) {
  api.use(['ecmascript', 'coffeescript']);
  api.use('tinytest');
  api.use('training:facilitators');
  api.addFiles('tests/facilitators-tests.coffee');
});

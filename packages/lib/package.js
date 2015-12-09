Package.describe({
  name: 'training:lib',
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
  packages = {
    client: [
      'ovcharik:alertify@0.3.11'
    ],
    server: [],
    both: [
      'ecmascript',
      'coffeescript',
      'ground:db@0.3.14',
      'jagi:astronomy@1.2.4',
      'cfs:standard-packages@0.5.9',
      'cfs:gridfs@0.0.33',
      'accounts-password@1.1.4',
      'alanning:roles@1.2.14',
      'promise@0.5.1',
			'kadira:flow-router@2.10.0',

      'velocity:html-reporter@0.9.1',
      'sanjo:jasmine@0.20.3',

      'mongo@1.1.3',
      'meteor-base@1.0.1',
      'tracker@1.0.9',
      'es5-shim@4.1.14',

      'autopublish@1.0.4',
      'insecure@1.0.4'
    ]
  };
  api.use(packages.both);
  api.use(packages.server, 'server');
  api.use(packages.client, 'client');

  api.imply(packages.both);
  api.imply(packages.server, 'server');
  api.imply(packages.client, 'client');

  api.addFiles('lib.js');
});

Package.onTest(function(api) {
  api.use('ecmascript');
  api.use('tinytest');
  api.use('training:lib');
  api.addFiles('lib-tests.js');
});

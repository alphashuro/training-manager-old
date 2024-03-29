Package.describe({
  name: 'training:core',
  version: '0.0.1',
  // Brief, one-line summary of the package.
  summary: 'Core package defining global namespace for Training App.',
  // URL to the Git repository containing the source code for this package.
  git: '',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.2.1');
  api.use(['training:lib', 'training:users', 'training:facilitators']);
  // api.addFiles('core.js');
});

Package.onTest(function(api) {
  api.use('ecmascript');
  api.use('tinytest');
  api.use('training:core');
  // api.addFiles('core-tests.js');
});

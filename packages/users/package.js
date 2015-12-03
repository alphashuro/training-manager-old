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
    'training:core',
    'ecmascript', 
    'coffeescript', 
    'ground:db@0.3.14', 
    'jagi:astronomy@1.2.4', 
    'cfs:standard-packages@0.5.9', 
    'cfs:gridfs@0.0.33', 
    'accounts-password@1.1.4',
    'alanning:roles@1.2.14'
    ]);
  api.addFiles('collections/users.coffee');
});

Package.onTest(function(api) {
  api.use(['ecmascript','coffeescript']);
  api.use('tinytest');
  api.use('training:users');
  api.addFiles('users-tests.coffee');
});

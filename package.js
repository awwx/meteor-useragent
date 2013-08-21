Package.describe({
  summary: "useragent parser for client and server"
});

Package.on_use(function (api) {
  api.use('coffeescript');
  api.export('parseUseragent', ['client', 'server']);
  api.export('Useragent', 'client');
  api.add_files(
    [
      'setup.js',
      'regexps.js',
      'useragent.coffee'
    ],
    ['client', 'server']
  );
});


Package.on_test(function (api) {
  api.use(['tinytest', 'coffeescript', 'useragent']);
  api.add_files('useragent-tests.coffee', ['client', 'server']);
});

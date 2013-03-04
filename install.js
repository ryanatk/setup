var fs = require('fs');
var request = require('request');
var argv = require('optimist').argv;
var colors = require('colors');

// bash_profile

// vimrc

// vim

// git completion
var processResponse = function (err, res, body) {
  console.log(body);
};
request({'uri': 'https://raw.github.com/git/git/master/contrib/completion/git-completion.bash'}, processResponse);

// ubuntu
  // .bashrc
// bash profile
(function (profile) {
  if (profile) {
    var file = new File('bash_profile');

    var data = [
      'export profile_name=\'' + profile + '\'',
      'source .setup/bash_profiles/main.bash',
      '#source .setup/bash_profiles/home.bash',
      '#source .setup/bash_profiles/work.bash',
      '#source .setup/bash_profiles/linux.bash',
      '#source .setup/bash_profiles/osx.bash'
    ];

    var writeFile = function (file) {
      fs.writeFile(file.dotname, data.join('\n'), 'utf8', function () {
        console.log('wrote to:', file.dotname);
        // need to reload bash_profile
      });
    };
    file.backup(writeFile);
  }
}(argv.profile || null));

// for ubuntu, write to .bashrc to load .bash_profile

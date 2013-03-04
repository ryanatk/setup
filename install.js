var fs = require('fs.extra');
var path = require('path');
var request = require('request');
var argv = require('optimist').argv;

/** setup must live in ~/.setup **/

// calculate and cache dir paths, timestamp
var home = path.join(__dirname, '..');
var targets = path.join(__dirname, 'targets');
var timestamp = new Date().getTime();

// create prototype for each file
var File = function (filename) {
  this.filename = filename;
  this.dotname = path.join(home, '.' + filename);
};

// extend file prototype to include functions
File.prototype = {
  // create a symlink from dotfile location to target code
  addSymlink: function (file) {
    var target = path.join(targets, file.filename);
    var dotname = file.dotname

    fs.symlink(target, dotname, function () {
      console.log('Added symlink:', dotname, '->', target);
    });
  },

  // backup the file, adding timestamp
  backup: function (callback) {
    var self = this;
    var dotname = self.dotname;
    var bkup = dotname + '.bkup.' + timestamp;

    fs.move(dotname, bkup, function (err) {
      if (!err) console.log('Created backup:', bkup);
      // execute callback
      if (callback) callback(self);
    });
  }
};

// get all target files for symlinking
(function () {
  fs.readdir(targets, function (err, filenames) {
    if (err) throw err;

    var len = filenames.length;

    while (len--) {
      var file = new File(filenames[len]);
      file.backup(file.addSymlink);
    }
  });
}());

// git completion
// fired by adding option --update
(function (update) {
  if (update) {
    // download from github to write to file
    request({'uri': 'https://raw.github.com/git/git/master/contrib/completion/git-completion.bash'}, function (err, res, body) {
      if (err || !body) {
        console.log('Failed to download git completion');
      } else {
        fs.writeFile('./git-completion.sh', body);
        console.log('Success: git completion');
      }
    });
  }
}(argv.update || null));

// bash profile
// fired by adding option --profile=machine_name
(function (profile) {
  if (profile) {
    var file = new File('bash_profile');

    var content = [
      'export profile_name=\'' + profile + '\'',
      'source .setup/bash_profiles/main.bash',
      '#source .setup/bash_profiles/home.bash',
      '#source .setup/bash_profiles/work.bash',
      '#source .setup/bash_profiles/linux.bash',
      '#source .setup/bash_profiles/osx.bash'
    ];

    // TODO: add this to prototype
    var writeFile = function (file) {
      fs.writeFile(file.dotname, content.join('\n'), 'utf8', function () {
        console.log('wrote to:', file.dotname);
        // need to figure out how to reload bash_profile
      });
    };
    file.backup(writeFile);
  }
}(argv.profile || null));

// for ubuntu, write to .bashrc to load .bash_profile


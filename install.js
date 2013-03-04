var fs = require('fs.extra');
var path = require('path');
var request = require('request');
var argv = require('optimist').argv;

var targets = path.join(__dirname, 'targets');
var home = path.join(__dirname, '..');
var timestamp = new Date().getTime();

var File = function (filename) {
  this.filename = filename;
  this.dotname = path.join(home, '.' + filename);
};

File.prototype = {
  addSymlink: function (file) {
    var target = path.join(targets, file.filename);
    var dotname = file.dotname

    fs.symlink(target, dotname, function () {
      console.log('Added symlink:', dotname, '->', target);
    });
  },

  backup: function (callback) {
    var self = this;
    var dotname = self.dotname;
    var bkup = dotname + '.bkup.' + timestamp;

    fs.move(dotname, bkup, function (err) {
      if (!err) console.log('Created backup:', bkup);
      if (callback) callback(self);
    });
  }
};

// get target files for symlinking
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
(function (update) {
  if (update) {
    request({'uri': 'https://raw.github.com/git/git/master/contrib/completion/git-completion.bash'}, function (err, res, body) {
      if (err) {
        throw err;
        console.log('Failed to download git completion');
      }
      else if (!body) {
        console.log('Failed to download git completion');
      } else {
        fs.writeFile('./git-completion.sh', body);
        console.log('Success: git completion');
      }
    });
  }
}(argv.update || null));

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


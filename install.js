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
  this.target = path.join(targets, filename);
  this.dotname = path.join(home, '.' + filename);
  this.content = '';
};

// extend file prototype to include functions
File.prototype = {
  // create a symlink from dotfile location to target code
  addSymlink: function (file) {
    var target = file.target;
    var dotname = file.dotname;

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
    return this;
  },

  curl: function (uri) {
    var target = this.target;

    // download from uri and write to file
    request({'uri': uri}, function (err, res, body) {
      if (err || !body) {
        console.log('Failed to download:', uri);
      } else {
        console.log('Success downloaded:', uri);
        fs.writeFile(target, body);
      }
    });
    return this;
  },

  write: function (file) {
    var dotname = file.dotname;
    fs.writeFile(dotname, file.content, 'utf8', function () {
      console.log('wrote to:', dotname);
      // need to figure out how to reload bash_profile
    });
  }
};


// if run with option --init, run all
if (argv.init) argv.all = true;

// fire functions based on options
if (argv.help) {
  help();
  return;
}
if (argv.profile || argv.all) {
  profile(argv);
}
if (argv.install || argv.all) {
  install();
}
if (argv.update || argv.all) {
  update();
}


// one day this will give help
function help() {
  console.log('i promise to help you later');
}


// bash profile --profile
function profile(arg) {
  var file = new File('bash_profile');
  var profiles = path.join(__dirname, 'bash_profiles');
  var name = typeof arg.profile === 'string' ? arg.profile : 'update_me_in_bash_profile';
  var content = ['export profile_name=\'' + name + '\'\n'];

  fs.readdir(profiles, function (err, filenames) {
    if (err) { onErr(err); }

    var len = filenames.length;
    while (len--) {
      var line = 'source ~/.setup/bash_profiles/';
      var filename = filenames[len];
      var option = filename.split('.')[0];

      if (!argv[option]) { line = '#' + line; }
      line += filename;
      content.push(line);
    }

    file.content = content.join('\n');
    file.backup(file.write);
  });
}


// get all target files for symlinking --install
function install() {
  fs.readdir(targets, function (err, filenames) {
    if (err) { onErr(err); }

    var len = filenames.length;
    while (len--) {
      var file = new File(filenames[len]);

      file.backup(file.addSymlink);
    }
  });
}


// git completion, pathogen --update
function update() {
  var completion = new File('git-completion.sh');
  completion.curl('https://raw.github.com/git/git/master/contrib/completion/git-completion.bash');

  var gprompt = new File('git-prompt.sh');
  gprompt.curl('https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh');

  var pathogen = new File('pathogen.vim');
  pathogen.target = path.join(targets, 'vim/autoload');
  pathogen.curl('https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim');
}


// for ubuntu, write to .bashrc to load .bash_profile


// error function
function onErr(err) {
  console.log(err);
  return 1;
}

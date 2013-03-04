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

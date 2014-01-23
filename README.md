#setup

setup files to follow me around to all machines

## Install

1. download to **~/.setup**

        $ cd ~
        $ git clone git@github.com:ryanatk/setup.git .setup

1. install node packages

        $ cd .setup
        $ npm install

1. run the install script

        $ node install.js --init
   
1. update and reload bash profile

		$ vim ~/.bash_profile
		$ . ~/.bash_profile
        
## updating

to stay updated, pull from git

		$ cd ~/.setup
		$ git pull origin master
		
and reload your bash_profile

		$ rbash


## Options

### init

run this the first time you install to set up everything

        $ node install.js --init

### profile

update your ~/.bash_profile
        
        $ node install.js --profile
        
update your machine name, uncomment the environment-specific bash profiles you want to use, and reload your bash_profile

		$ vim ~/.bash_profile
		$ rbash
		
optionally, you can set machine name and declare profiles with options

        $ node install.js --profile=mba --osx --home
		
### install

symlinks dotfiles in .setup/targets/

        $ node install.js --install

### update

update your scripts with the newest code from github: git completion and prompt, vim plugins (pathogen, nerdtree, and syntastic)
		
		$ node install.js --update
		

### help

for help on the command line

		$ node install.js --help
		
		
## Dependencies

### git

to check if you have git

        $ git --version

to download and install: <http://git-scm.com/downloads>

### node.js

to check if you have node.js

        $ node --version
        
to download and install: <http://nodejs.org/download/>

### jshint

to check if you have jshint installed

        $ jshint --version
        
to download and install

        $ sudo npm install -g jshint
        
       

## Todos

- fix the private.bash
    - add to gitignore and make install script create a file with 1 line
- better help
- move backup files into this dir

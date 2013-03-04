#setup

setup files to follow me around to all machines

## Install

1. download the repo into **.setup** in your home directory

        $ cd ~
        $ git clone git@github.com:ryanatk/setup.git .setup

1. download your node dependencies

        $ cd .setup
        $ npm install

1. run the install script

        $ node install.js
   
        
## updating

you will not need to run the script again. to stay updated, you only need to pull from git

		$ cd ~/.setup
		$ git pull origin master
		
and reload your bash_profile

		$ . ~/.bash_profile

## Options

### bash_profile and machine_nickname

the first time you install, you will want to declare your machine nickname (will appear in your terminal's command line prompt) and update your ~/.bash_profile
        
        $ node install.js --profile=<machine_nickname>
        
where <machine_nickname> can be whatever string you'd like (preferrably something short like "mba" or "linode")

this will also backup and update your ~/.bash_profile to now use files within .setup/bash_profiles

		$ vim ~/.bash_profile
		
and uncomment the environment-specific bash profiles you want to use

		$ . ~/.bash_profile
		
to reload your bash_profile

### update git completion and prompt

you can also update your git completion and prompt scripts by adding the update option
		
		$ cd ~/.setup
		$ node install.js --update
		
this will pull the newest code from github

## Dependencies

### git
to check if you have git:

        $ git --version

to download and install: <http://git-scm.com/downloads>

### node.js
to check if you have node.js:

        $ node --version
to download and install: <http://nodejs.org/download/>



export ANT_HOME="/opt/ant"

# ssh
alias prelive="ssh prelive.zappos.net"
alias sshubuntu='ssh ud43d7e3fd7c851837c6b.ant.amazon.com'
alias sshrhel5='ssh ryaatkin@ryaatkin.desktop.amazon.com'

# zeta build commands
alias tomstart='(cd ~/tomcat/; ./bin/startup.sh)'
alias tomstop='(cd ~/tomcat/; ./bin/shutdown.sh; sleep 2; killall -9 java;)'
alias tombounce='(cd ~/tomcat/; ./bin/shutdown.sh; sleep 8; killall -9 java; sleep 2; ./bin/startup.sh;)'
alias touchbounce='touch ~/tomcat/conf/web.xml'
alias heliosAtlasStart='cd ~/zeta/Atlas; mvn clean package install -DbuildHeliosStack -DskipTests'
alias buildvalhalla='cd ~/zeta/valhalla; mvn clean install -DskipTests -U'
alias selenium='(cd ~/zeta/Clusterfork/lib; java -jar selenium-server-standalone-2.28.0.jar)'
alias jmeter='/Users/ratkinson/apache-jmeter-2.8/bin/jmeter ; exit;'

# zeta file locations
alias cz='cd ~/zeta/'
alias cfront='cd ~/zeta/thor/frontend'
alias cthor='cd ~/zeta/thor/frontend'
alias chdt='cd ~/zeta/HD-THOR/frontend'
alias csahara='cd ~/zeta/sahara/frontend'
alias chds='cd ~/zeta/HD-SAHARA/frontend'
alias cps='cd ~/zeta/pixel-server'
alias carttable='mvim rebar/macros/z/cartTable.ftl'
alias pixels='mvim zappos.com/checkout/trackingPixels.ftl 6pm.com/checkout/trackingPixels.ftl'

# tail logs
alias elogs='tail -n 2000 -f ~/zeta/sahara/target/cargo/configurations/*/logs/* | grep "\[ERROR\]" -A 8 '
alias etomlogs='tail -n 2000 -f ~/tomcat/logs/*catalina.out | grep "\[ERROR\]" -A 8 '
alias tomlogs='tail -n 1000 -F ~/tomcat/logs/*catalina.out'

# edit properties files
alias espring='vim ~/.spring/global.properties'
alias ehelios='vim ~/.spring/helios.properties'

# in frontend, run clipboard thru closure
alias jscompress='pbpaste | java -jar closure.jar | pbcopy'

# ec2
export EC2_HOME=~/.aws/ec2-api-tools-1.6.7.1
export PATH=$PATH:$EC2_HOME/bin:~/.aws/AWS-ElasticBeanstalk-CLI-2.3.1/eb/macosx/python2.7

# get zfc headers back in curl
alias curlz='curl -H "X-ZFC-Debug: on" -I'

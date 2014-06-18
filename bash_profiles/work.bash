export ANT_HOME="/opt/ant"

# ssh
alias prelive="ssh prelive.zappos.net"
alias sshubuntu='ssh ud43d7e3fd7c851837c6b.ant.amazon.com'
alias sshrhel5='ssh ryaatkin@ryaatkin.desktop.amazon.com'
alias sshodin='ssh -L 2009:127.0.0.1:2009 $USER.desktop.amazon.com'

# git
alias gpush='git push ratkinson HEAD'

# zeta build commands
alias tomstart='(cd ~/tomcat/; ./bin/startup.sh)'
alias tomstop='(cd ~/tomcat/; ./bin/shutdown.sh; sleep 2; killall -9 java;)'
alias tombounce='(cd ~/tomcat/; ./bin/shutdown.sh; sleep 8; killall -9 java; sleep 2; ./bin/startup.sh;)'
alias touchbounce='touch ~/tomcat/conf/web.xml'
alias heliosAtlasStart='cd ${ZETA_DIR}/Atlas; mvn clean package install -DbuildHeliosStack -DskipTests'
alias buildvalhalla='cd ${ZETA_DIR}/valhalla; mvn clean install -DskipTests -U'
alias buildbroadway-common='cd ${ZETA_DIR}/broadway/broadway-common && mvn clean install -DskipTests'
alias buildspock='cd ${ZETA_DIR}/spock && export JAVA_HOME=$(/usr/libexec/java_home) && export "CATALINA_OPTS=-Dlog4j.configuration=file:$HOME/tomcat/conf/log4j.xml" && mvn clean compile install -DskipTests -U'
alias broadwaystart='cd ${ZETA_DIR}/broadway/broadway-server && mvn jetty:run'
alias jmeter='/Users/ratkinson/apache-jmeter-2.8/bin/jmeter ; exit;'
alias java7='source ~/.profile'

# zeta file locations
export WORKSPACE_DIR='${ZETA_DIR}'
alias cz='cd ${ZETA_DIR}'
alias cfront='cd ${ZETA_DIR}/frontends'
alias csahara='cd ${ZETA_DIR}/frontends/sahara'
alias cthor='cd ${ZETA_DIR}/frontends/thor'
alias chamlet='cd ${ZETA_DIR}/frontends/hamlet'
alias ckirk='cd ${ZETA_DIR}/frontends/kirk'
alias ctater='cd ${ZETA_DIR}/frontends/tater'
alias cpinot='cd ${ZETA_DIR}/frontends/pinot'
alias cabu='cd ${ZETA_DIR}/frontends/abu'
alias cps='cd ${ZETA_DIR}/pixel-server'
alias cdev='cd ${ZETA_DIR}/dev-properties'

alias carttable='mvim rebar/macros/z/cartTable.ftl'
alias pixels='mvim zappos.com/checkout/trackingPixels.ftl 6pm.com/checkout/trackingPixels.ftl'

# tail logs
alias elogs='tail -n 2000 -f ${ZETA_DIR}/cargo/configurations/*/logs/* | grep "\[ERROR\]" -A 8 '
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

# lode
export ANT_OPTS='-Dhappytrails.platform.override=RHEL5 -Dhappytrails.root=/usr/local/lode/ZapposEaseOfDevelopment/happytrails -Xmx500M'
launchctl setenv ANT_OPTS "$ANT_OPTS"

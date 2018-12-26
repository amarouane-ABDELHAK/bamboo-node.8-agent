FROM atlassian/bamboo-agent-base
USER root
ENV NODE_VERSION 8.11.4
RUN apt-get update && \
    apt-get install git -y 


USER ${BAMBOO_USER}
RUN wget https://raw.githubusercontent.com/creationix/nvm/master/install.sh -O /tmp/nvm_install.sh && \
	bash /tmp/nvm_install.sh 

RUN . ~/.nvm/nvm.sh




#ENTRYPOINT ["bash"] 
RUN ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.builder.mvn3.Maven 3.3" /usr/share/maven
RUN ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.git.executable" /usr/bin/git
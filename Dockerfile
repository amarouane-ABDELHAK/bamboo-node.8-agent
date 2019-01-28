FROM atlassian/bamboo-agent-base
USER root
ENV NODE_VERSION 8.11.4
RUN apt-get update && \
    apt-get install git -y  

USER ${BAMBOO_USER}
SHELL ["/bin/bash", "-c"]
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
RUN mkdir ${BAMBOO_USER_HOME}/run_task
COPY bamboo_task.sh ${BAMBOO_USER_HOME}/run_task/bamboo_task.sh
#ENTRYPOINT ["bash"] 
RUN ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.builder.mvn3.Maven 3.3" /usr/share/maven
RUN ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.git.executable" /usr/bin/git
RUN ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.builder.node.Node.js 8" /home/bamboo/.nvm/versions/node/v8.11.4/bin/node

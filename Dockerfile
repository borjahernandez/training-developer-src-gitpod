FROM gitpod/workspace-full:latest

USER nobody
RUN echo "127.0.0.1	kafka" >> /etc/hosts

USER gitpod
# Install Confluent Platform 6.2.1
RUN sudo wget --quiet -P /home/gitpod/ http://packages.confluent.io/archive/6.2/confluent-community-6.2.1.tar.gz \
        && sudo tar xzf /home/gitpod/confluent-community-6.2.1.tar.gz \
        && sudo rm /home/gitpod/confluent-community-6.2.1.tar.gz

# Setup PATH env variable
USER gitpod
ENV PATH="/home/gitpod/confluent-6.2.1/bin:$PATH"

FROM gitpod/workspace-full:latest

# Install Confluent Platform 6.2.1
USER root
RUN wget --quiet -P /home/ http://packages.confluent.io/archive/6.2/confluent-community-6.2.1.tar.gz \
        && tar xzf /home/confluent-community-6.2.1.tar.gz \
        && rm /home/confluent-community-6.2.1.tar.gz

# Setup PATH env variable
USER gitpod
ENV PATH="/home/confluent-6.2.1/bin:$PATH"

# Give back control
USER root

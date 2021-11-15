FROM gitpod/workspace-full:latest

# Install Confluent Platform 6.2.1
USER root
RUN wget --quiet -P /workspace/ http://packages.confluent.io/archive/6.2/confluent-community-6.2.1.tar.gz \
        && tar xzf /workspace/confluent-community-6.2.1.tar.gz \
        && rm confluent-community-6.2.1.tar.gz

# Setup PATH env variable
USER gitpod
ENV PATH="/workspace/confluent-6.2.1/bin:$PATH"

# Give back control
USER root

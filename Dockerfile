FROM gitpod/workspace-full:latest

USER root
RUN touch /home/gitpod/hosts1
RUN echo '127.0.0.1	kafka' >> /home/gitpod/hosts1
RUN echo '127.0.0.1	zookeeper' >> /home/gitpod/hosts1
RUN echo '127.0.0.1	schema-registry' >> /home/gitpod/hosts1
RUN echo '127.0.0.1	connect' >> /home/gitpod/hosts1
RUN echo '127.0.0.1	ksqldb-server' >> /home/gitpod/hosts1
RUN echo '127.0.0.1	postgres' >> /home/gitpod/hosts1
RUN echo '127.0.0.1	localhost' >> /home/gitpod/hosts1
RUN echo '::1	localhost ip6-localhost ip6-loopback' >> /home/gitpod/hosts1
RUN echo 'fe00::0	ip6-localnet' >> /home/gitpod/hosts1
RUN echo 'fe00::0	ip6-mcastprefix' >> /home/gitpod/hosts1
RUN echo 'fe00::1	ip6-allnodes' >> /home/gitpod/hosts1
RUN echo 'fe00::2	ip6-allrouters' >> /home/gitpod/hosts1
RUN echo '10.52.23.60	ws-194691e1-3d09-4f94-9187-6614b966fc91' >> /home/gitpod/hosts1

USER gitpod
# Install Confluent Platform 6.2.1
RUN sudo wget --quiet -P /home/gitpod/ http://packages.confluent.io/archive/6.2/confluent-community-6.2.1.tar.gz \
        && sudo tar xzf /home/gitpod/confluent-community-6.2.1.tar.gz \
        && sudo rm /home/gitpod/confluent-community-6.2.1.tar.gz

# Setup PATH env variable
USER gitpod
ENV PATH="/home/gitpod/confluent-6.2.1/bin:$PATH"

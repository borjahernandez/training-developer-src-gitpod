FROM gitpod/workspace-full:latest

USER root
RUN cat >> /home/gitpod/hosts1 << EOF \
       # Kubernetes-managed hosts file. \
       # DEV host entries \
       127.0.0.1	kafka \
       127.0.0.1	zookeeper \
       127.0.0.1	schema-registry \
       127.0.0.1	connect \
       127.0.0.1	ksqldb-server \
       127.0.0.1	postgres \
       127.0.0.1	localhost \
       ::1	localhost ip6-localhost ip6-loopback \
       fe00::0	ip6-localnet \
       fe00::0	ip6-mcastprefix \
       fe00::1	ip6-allnodes \
       fe00::2	ip6-allrouters \
       10.52.23.60	ws-194691e1-3d09-4f94-9187-6614b966fc91 \
       EOF

USER gitpod
# Install Confluent Platform 6.2.1
RUN sudo wget --quiet -P /home/gitpod/ http://packages.confluent.io/archive/6.2/confluent-community-6.2.1.tar.gz \
        && sudo tar xzf /home/gitpod/confluent-community-6.2.1.tar.gz \
        && sudo rm /home/gitpod/confluent-community-6.2.1.tar.gz

# Setup PATH env variable
USER gitpod
ENV PATH="/home/gitpod/confluent-6.2.1/bin:$PATH"

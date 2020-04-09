FROM registry.access.redhat.com/ubi8/ubi:8.1

RUN dnf install -y git
RUN git clone https://github.com/openshift/cincinnati-graph-data

CMD exec /bin/bash -c "rm -rf /tmp/cincinnati-graphdata/*; cp -rf /cincinnati-graph-data/* /tmp/cincinnati-graph-data/"

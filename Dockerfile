FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y owncloud-client-cmd

COPY *.sh /
WORKDIR /root
CMD ["/run.sh"]

ENV OC_USER=oc_username \
    OC_PASS=oc_passwordORtoken \
    OC_SERVER=yourserver.com

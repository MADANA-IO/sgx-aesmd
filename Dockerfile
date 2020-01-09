FROM  ubuntu:bionic

ENV AESM_PATH=/opt/intel/libsgx-enclave-common/aesm
ENV LD_LIBRARY_PATH=$AESM_PATH

RUN apt-get update && apt-get install -y wget && \
  wget https://download.01.org/intel-sgx/sgx-linux/2.7.1/distro/ubuntu18.04-server/libsgx-enclave-common_2.7.101.3-bionic1_amd64.deb && \
  (dpkg -i libsgx-enclave-common_2.7.101.3-bionic1_amd64.deb || true) && \
  apt-get -f install -y && apt purge -y wget && apt-get autoremove -y \ 
  && rm -rf /var/lib/apt/lists/* && \
  /bin/mkdir -p /var/run/aesmd/ && \
  /bin/chown -R aesmd:aesmd /var/run/aesmd/ && \
  /bin/chmod 0755 /var/run/aesmd/ && \
  /bin/chown -R aesmd:aesmd /var/opt/aesmd/ && \
  /bin/chmod 0750 /var/opt/aesmd/


WORKDIR $AESM_PATH

CMD ["/bin/bash", "-c", "$AESM_PATH/aesm_service --no-daemon"]

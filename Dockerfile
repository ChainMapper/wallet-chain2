FROM packages.netwatwezoeken.nl/chainmapper/wallet-base-bionic:latest

ENV WALLET_URL=https://github.com/chain2/chain2/releases/download/v0.11O/chain2-0.11.0-O-linux64.tar.gz

RUN wget $WALLET_URL -O /tmp/wallet.tar.gz \
	&& cd /usr/local/bin \
	&& tar zxvf /tmp/wallet.tar.gz  --strip-components 2\
	&& mkdir -p /data/.chain2

#rpc port
EXPOSE 6666

ENV HOME /data

COPY start.sh /start.sh
COPY gen_config.sh /gen_config.sh
COPY wallet.sh /wallet.sh
RUN chmod 777 /*.sh
CMD /start.sh bitcoin.conf CTWO bitcoind
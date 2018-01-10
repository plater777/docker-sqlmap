FROM debian:stable-slim

RUN apt-get update && \
apt-get install -y --force-yes gnupg && \
gpg --keyserver pgp.mit.edu --recv-keys ED444FF07D8D0BF6 && \ 
gpg -a --export 7D8D0BF6 | apt-key add - && \
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list && \
apt-get update && \
apt-get install -y --force-yes sqlmap && \
apt-get autoclean

ENTRYPOINT ["/usr/bin/python", "/usr/bin/sqlmap"]

CMD ["-h"]
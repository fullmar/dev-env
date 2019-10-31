FROM python:3
WORKDIR /workspace

ENV OPENSSL_CONF=/openssl.conf

# Install PhantomJS
ENV PHANTOMJS_VERSION 2.1.1
RUN wget --no-check-certificate -q -O - https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 | tar xjC /opt
RUN ln -s /opt/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin/phantomjs /usr/bin/phantomjs

RUN pip install --upgrade pip
RUN pip install selenium

RUN touch /openssl.conf

# customize bash
COPY bashrc-additions .
RUN ["bash", "-c", "sed 's/{env}/python/' bashrc-additions >> ~/.bashrc"]
EXPOSE 8000
ENTRYPOINT ["bash"]

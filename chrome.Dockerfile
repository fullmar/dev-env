FROM ubuntu:bionic
WORKDIR /workspace

ENV OPENSSL_CONF=/openssl.conf

RUN apt-get update -y && apt-get install -y python3.7 python3-pip python3-dev
RUN sed -i 's/python3/python3.7/g' /usr/bin/pip3
RUN apt-get install -y chromium-browser chromium-chromedriver
RUN ln -s /usr/bin/python3.7 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip

RUN touch /openssl.conf

# customize bash
COPY bashrc-additions .
RUN ["bash", "-c", "sed 's/{env}/python/' bashrc-additions >> ~/.bashrc"]
EXPOSE 8000
ENTRYPOINT ["bash"]

FROM pandeiro/lein:latest
WORKDIR /workspace

# customize bash
COPY bashrc-additions .
RUN ["bash", "-c", "sed 's/{env}/python/' bashrc-additions >> ~/.bashrc"]

ENTRYPOINT ["bash"]

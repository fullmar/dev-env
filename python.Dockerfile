FROM python:3
WORKDIR /workspace

# customize bash
COPY bashrc-additions .
RUN ["bash", "-c", "sed 's/{env}/python/' bashrc-additions >> ~/.bashrc"]
EXPOSE 8000
ENTRYPOINT ["bash"]

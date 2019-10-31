FROM python:3
WORKDIR /workspace

RUN pip install rasa-x --extra-index-url https://pypi.rasa.com/simple

# customize bash
COPY bashrc-additions .
RUN ["bash", "-c", "sed 's/{env}/python/' bashrc-additions >> ~/.bashrc"]
EXPOSE 8000
ENTRYPOINT ["bash"]

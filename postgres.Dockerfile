FROM postgres
WORKDIR /workspace

# customize bash
COPY bashrc-additions .
RUN ["bash", "-c", "sed 's/{env}/redis/' bashrc-additions >> ~/.bashrc"]
EXPOSE 5432
ENTRYPOINT ["bash"]

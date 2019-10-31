FROM redis
WORKDIR /workspace

# customize bash
COPY bashrc-additions .
RUN ["bash", "-c", "sed 's/{env}/redis/' bashrc-additions >> ~/.bashrc"]
EXPOSE 6379
ENTRYPOINT ["bash"]

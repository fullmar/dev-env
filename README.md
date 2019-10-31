Docker based environment management tool for development. Gives access to current dir and lower from /workspace mounted dir from within container.

Requires docker and docker-compose.

to use:
  - put files somewhere
  - add to path
    - verify with '''which dev-env'''
  - run with
    - dev-env {environment}
      - environment must be defined in docker-compose

Only testing for unix-like systems - no promises for windows systems.

to add a new environment:
  - add new dockerfile for environment
    - must include following lines for local files:

at top (after FROM, etc.):
```
WORKDIR /workspace
```

at bottom (to customize bash):
```
# customize bash
COPY bashrc-additions .
RUN ["bash", "-c", "sed 's/{env}/python/' bashrc-additions >> ~/.bashrc"]
ENTRYPOINT ["bash"]
```

also remember to expose any ports needed

  - then add entry to docker-compose.yml
  - add any files needed under misc-files dir


Contributions encouraged!

FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y clisp

WORKDIR /home

CMD ["/bin/bash"]

# docker build -t clisp .
# docker run -it --rm -v ${PWD}:/home clisp
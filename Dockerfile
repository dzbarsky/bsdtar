FROM ubuntu
RUN apt-get update && apt-get install -y ca-certificates curl git python3 
RUN curl -L https://github.com/bazelbuild/bazelisk/releases/download/v1.18.0/bazelisk-linux-amd64 -o /usr/bin/bazel && chmod +x /usr/bin/bazel

RUN adduser fakeuser
USER fakeuser

WORKDIR /bsdtar
COPY .bazelversion .
RUN touch WORKSPACE && bazel help
RUN echo "bazel build //:all" > ~/.bash_history

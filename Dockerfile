FROM ubuntu:latest
ARG GITEE_USERNAME
ARG GITEE_PASSWORD
RUN apt-get update && apt-get install -y git gcc \
  && apt-get install -y build-essential g++ libx11-dev libxkbfile-dev libsecret-1-dev python-is-python3 \
  && apt-get install -y curl dirmngr apt-transport-https lsb-release ca-certificates

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
  && apt-get install -y nodejs 
  
RUN node -v 

RUN npm install --global yarn && npm install -g node-gyp 

RUN node -v && npm -v && yarn -v && node-gyp -v
RUN git clone https://${GITEE_USERNAME}:${GITEE_PASSWORD}@gitee.com/its-not-too-late-breeze/code-server.git

RUN yarn && \
  yarn build && \
  yarn build:vscode && \
  yarn release

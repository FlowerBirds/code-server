FROM python:3.6-slim

RUN apt-get update && apt-get install -y git gcc \
  && apt-get install -y build-essential g++ libx11-dev libxkbfile-dev libsecret-1-dev \
  && apt-get install -y curl dirmngr apt-transport-https lsb-release ca-certificates \
  && apt-get install -y nodejs \
  && npm install --global yarn && npm install -g node-gyp 

RUN node -v && npm -v && yarn -v && node-gyp -v

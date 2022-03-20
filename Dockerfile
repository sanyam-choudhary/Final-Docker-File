FROM node:alpine
MAINTAINER Sanyam Choudhary
RUN apk add --update --no-cache git openssh ca-certificates openssl curl
RUN npm install sfdx-cli --global
RUN npm install sfdx-git-delta@latest -g
#RUN echo 'y' | sfdx plugins:install sfdx-git-delta
RUN sfdx --version
USER node
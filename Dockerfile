FROM node:alpine
MAINTAINER Sanyam Choudhary
RUN apk add --update --no-cache git openssh ca-certificates openssl curl
RUN npm install sfdx-cli --global
RUN sfdx --version
USER node

FROM salesforce/salesforcedx:latest-rc-full
RUN echo 'y' | sfdx plugins:install sfdx-git-delta
RUN echo 'y' | sfdx plugins:install @salesforce/sfdx-scanner
RUN echo 'y' | sfdx plugins:install sfpowerkit
RUN sfdx --version
RUN sfdx plugins --core
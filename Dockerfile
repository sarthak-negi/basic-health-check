## Specifies the base image we're extending
FROM node:alpine

## Create base directory
RUN mkdir /src

## Specify the "working directory" for the rest of the Dockerfile
WORKDIR /src

## Install packages using NPM 5 (bundled with the node:9 image)
COPY ./package.json /src/package.json
COPY ./package-lock.json /src/package-lock.json
RUN npm install --silent

## Add application code
COPY ./app.js /src/app.js
COPY ./.env /src/.env

## Set environment to "development" by default
ENV NODE_ENV development

## Allows port 7777 to be publicly available
EXPOSE 7777

## The command uses node to run the application
CMD ["node", "app.js"]
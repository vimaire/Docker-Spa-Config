FROM node:10.0-alpine as build
LABEL maintainer="Alexandre Trigueros"
RUN mkdir /app
WORKDIR /app
COPY app/package.json /app
COPY app/package-lock.json /app
RUN npm i
COPY app/ /app/
RUN npm run build

FROM node:10.0-alpine as run
RUN mkdir -p /app/public
WORKDIR /app
COPY server/ /app/
RUN npm i
COPY --from=build /app/build/ /app/public/

EXPOSE 80
ENV CFG_MESSAGE "Hello world"
ENV NODE_ENV "production"

CMD ["npm", "start"]

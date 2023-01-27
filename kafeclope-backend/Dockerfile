FROM node:lts-alpine

RUN apk update &&\
    apk add --no-cache curl &&\
    curl -fsSL 'https://github.com/pnpm/pnpm/releases/download/v7.26.1/pnpm-linuxstatic-x64' -o /bin/pnpm &&\
    chmod +x /bin/pnpm &&\
    mkdir /source

WORKDIR /source

COPY package.json pnpm-lock.yaml ./

COPY . .

RUN pnpm install

RUN chown -R node:node /source/node_modules
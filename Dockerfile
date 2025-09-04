FROM node:18-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl wget \
    && rm -rf /var/lib/apt/lists/*
RUN npm install -g npm@9.1.3

ADD package.json .
ADD index.js .
ADD build .
COPY . .
RUN npm install

EXPOSE 8080

CMD [ "node", "index.js" ]

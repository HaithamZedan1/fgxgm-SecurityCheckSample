FROM node:18.20.3

RUN apt-get update && apt-get dist-upgrade -y && rm -rf /var/lib/apt/lists/*

ADD package.json .
ADD index.js .
ADD build .
COPY . .
RUN npm install

EXPOSE 8080

CMD [ "node", "index.js" ]

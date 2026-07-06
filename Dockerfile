# Build and Push Docker Image
FROM node:alpine3.22

WORKDIR /tmp

ENV PORT=3000
ENV SUB_PATH=sub
ENV PROJECT_URL=https://qaz331022-ag432xlexq.dcdeploy.cloud

COPY index.js index.html package.json ./

EXPOSE 3000/tcp

RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils &&\
    apk add --no-cache bash &&\
    chmod +x index.js &&\
    npm install

CMD ["node", "index.js"]

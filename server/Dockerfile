FROM node:v20.18.1-alpine3.17
RUN mkdir -p /home/node/app
WORKDIR /home/node/app
COPY . .
RUN npm install --omit=dev
EXPOSE 3000
CMD [ "node", "index.js"]
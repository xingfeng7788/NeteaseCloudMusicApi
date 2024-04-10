FROM node:lts-alpine

RUN apk add --no-cache tini

ENV NODE_ENV production
# USER node

WORKDIR /app

COPY --chown=node:node . ./

RUN npm install

EXPOSE 3000

CMD [ "/sbin/tini", "--", "node", "app.js" ]

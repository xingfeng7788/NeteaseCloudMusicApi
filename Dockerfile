FROM node:lts-alpine3.19

RUN apk add --no-cache tini

ENV NODE_ENV production
# USER node

WORKDIR /app

COPY --chown=node:node . ./

RUN yarn --network-timeout=100000

EXPOSE 3000

CMD [ "/sbin/tini", "--", "node", "app.js" ]

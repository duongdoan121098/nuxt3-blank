# stage 1: builder stage
# Dockerfile
FROM node:16.14-alpine as builder

# create destination directory
WORKDIR /app
COPY package*.json ./
# update and install dependency
RUN apk update && apk upgrade
RUN apk --update add npm && \
    npm install -g autoprefixer postcss-cli && \
    rm -rf /var/cache/apk/*

RUN apk add git

RUN npm install
COPY . .
RUN npm run build

# stage 2: production builder
# copy the app, note .dockerignore
FROM node:node:16.14-alpine as production-stage
WORKDIR /app
ADD package.json .
ADD nuxt.config.js .
COPY --from=builder /app/ ./.
# COPY --from=builder /app/node_modules ./node_modules
# COPY --from=builder /app/static ./static
# COPY --from=builder /app/config ./config
# COPY --from=builder /app/locales ./locales

EXPOSE 3002

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3002

CMD [ "npm", "start" ]

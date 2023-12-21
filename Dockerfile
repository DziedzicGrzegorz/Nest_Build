# Installing dependencies:
FROM node:21-alpine3.19 AS install-dependencies

WORKDIR /user/src/app

COPY package.json package-lock.json ./

RUN npm install -g npm@10.2.5

RUN npm ci

COPY . .


# Creating a build:
FROM node:21-alpine3.19 AS create-build

WORKDIR /user/src/app

COPY --from=install-dependencies /user/src/app ./

RUN npm install -g npm@10.2.5

RUN npm run build

USER node


# Running the application:
FROM node:21-alpine3.19 AS run

WORKDIR /user/src/app

RUN npm install -g npm@10.2.5

COPY --from=install-dependencies /user/src/app/node_modules ./node_modules
COPY --from=create-build /user/src/app/dist ./dist
COPY package.json ./


RUN npm prune --production

CMD ["npm", "run", "start:prod"]
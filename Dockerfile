FROM node:lts-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

CMD [ "npm", "run", "start" ]


FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
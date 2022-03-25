FROM nginx:stable-alpine
# FROM nginx:1.20.2-alpine

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}
#ENV NODE_ENV production

# MacOS staff group's gid is 20, so is the dialout group in alpine linux. We're not using it, let's just remove it.
RUN delgroup dialout

RUN addgroup -g ${GID} --system laravel
RUN adduser -G laravel --system -D -s /bin/sh -u ${UID} laravel
RUN sed -i "s/user  nginx/user laravel/g" /etc/nginx/nginx.conf

# ADD ./nginx/default.conf /etc/nginx/conf.d/
ADD ./nginx/laravel.conf /etc/nginx/conf.d/

RUN mkdir -p /var/www/html

# Uncomment for production if /src/node_modules doesn't exist
# and you don't use entrypoint
#CMD ["npm", "ci", "--only-production"]
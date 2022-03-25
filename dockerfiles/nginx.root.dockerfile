FROM nginx:stable-alpine
# FROM nginx:1.20.2-alpine

RUN sed -i "s/user  nginx/user root/g" /etc/nginx/nginx.conf

# ADD ./nginx/default.conf /etc/nginx/conf.d/
ADD ./nginx/laravel.conf /etc/nginx/conf.d/

RUN mkdir -p /var/www/html

#ENV NODE_ENV production

# Uncomment for production if /src/node_modules doesn't exist
# and you don't use entrypoint
#CMD ["npm", "ci", "--only-production"]
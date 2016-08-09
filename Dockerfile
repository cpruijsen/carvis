FROM node:argon

# Install app dependencies
ADD package.json /tmp/package.json
RUN npm i -gqq nodemon
RUN cd /tmp && npm install -qq
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app/

# Create app directory
WORKDIR /opt/app
ENV hello 'hello'

# Bundle app source
ADD . /opt/app

EXPOSE 8000
CMD [ "npm", "start" ]

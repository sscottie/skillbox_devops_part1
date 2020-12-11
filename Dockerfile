FROM node

RUN mkdir /skillbox
WORKDIR /skillbox

COPY flatris/package.json /skillbox
COPY flatris/yarn.lock /skillbox
RUN cd /skillbox && yarn install

COPY flatris /skillbox

RUN cd /skillbox && yarn test
RUN cd /skillbox && yarn build

EXPOSE 3000

CMD cd /skillbox && yarn start
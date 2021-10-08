FROM node:15.14.0
WORKDIR /home/node/app
EXPOSE 3000
COPY . /home/node/app

SHELL ["/bin/bash", "-c"]

RUN echo $'SERVICE_NAME=note-app \n\
DB_HOST=${{ secrets.DB_HOST }}\n\
DB_USER=${{ secrets.DB_USER }}\n\
DB_PASS=${{ secrets.DB_PASS }}\n\
DB_NAME=${{ secrets.DB_NAME }}' > .env

RUN npm install
CMD ["npm","start"]
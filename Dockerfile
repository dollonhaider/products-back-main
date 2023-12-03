#Use the Node Image
FROM node:slim

#Set /app as the working directory
WORKDIR /app

#Copy the create-products app into the workdir
COPY . /app

#Install the dependencies
RUN npm install

CMD npm start
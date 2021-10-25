# In this we create comments in the docker file
# This docker file is used to create a custom docker image, where in this example the base images is the node image

# calling the base image
FROM node:15

# setting up a working directory of our container
# /app directory is already in the container, but need to confirm it
# Basically setting the work directory means that the command is going to be from this directory
# if i copy any files to the contianer it will send it to this directory in the container.
WORKDIR /app

# copying the package.json app to the container
COPY package.json .  

# running npm install
RUN npm install

# now we are copying all the current working directory files into the docker container
# Here we are copying again everything because, because the above files are already cached
# all the lines in the dockerfile are the image layer, which are built on one another.
# docker also cached the result of the each of the image layer
# so for the first time it will take time to build the image, but for the second time, it only work on the changed file.s
COPY . ./

# this will expose the container to 3000
EXPOSE 3000

# now we are writing command to run the contianer
CMD ["node", "index.js"]

# now we are going to buil the docker image "docker build ./Dockerfile"
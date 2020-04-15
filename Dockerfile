# use a node base container image
FROM node
MAINTAINER Dean Houari
ADD web-server.js /web-server.js
ENTRYPOINT ["node", "web-server.js"]



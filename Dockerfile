FROM node
WORKDIR /app
COPY package.json .
COPY index.js .
RUN npm install
EXPOSE 3000
HEALTHCHECK --interval=60s --timeout=5s --retries=3 \
  CMD curl -f http://localhost:3000/ || exit 1

CMD [ "node", "index.js" ]
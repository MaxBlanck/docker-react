# tag with builder phase
FROM node:alpine as builder
WORKDIR '/app'
COPY ./package.json .
RUN npm install 
COPY  . .
RUN npm run build
# From statement terminates previous block
FROM nginx


# Copy output from builder phase to specific nginx folder 
COPY --from=builder /app/build/ /usr/share/nginx/html
#Default command to start nginx is started automatically
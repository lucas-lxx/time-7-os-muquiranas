FROM node:23

WORKDIR /app

# COPY package*.json ./

RUN userdel -r node

ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid ${GROUP_ID} user
RUN useradd -u ${USER_ID} -g ${GROUP_ID} -m -s /bin/bash -p "" user
USER user

# RUN npm install

COPY . .

ENTRYPOINT ["npm"]

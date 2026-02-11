# Single-stage. Node 20 LTS 사용 (22는 Docker에서 exit 139 나는 경우 있음)
FROM node:20-alpine

WORKDIR /app

COPY package.json tsconfig.json ./
ENV NODE_OPTIONS="--max-old-space-size=512"
RUN npm install --no-audit --prefer-offline

COPY src ./src
RUN npm run build

ENV NODE_ENV=production
EXPOSE 3000

CMD ["node", "dist/index.js"]

FROM node:22-bookworm AS builder

WORKDIR /app

COPY package*.json ./
# Install all dependencies (dev + prod) to build the app
RUN npm install

# Copy source and build
COPY . .
RUN npx prisma generate
RUN npm run build

# --- Production Image ---
FROM node:22-bookworm AS production

WORKDIR /app
# Only copy built app and prod dependencies
COPY package*.json ./
RUN npm install --omit=dev

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/prisma ./prisma
RUN npx prisma generate

CMD ["sh", "-c", "npx prisma migrate deploy && node dist/main.js"]


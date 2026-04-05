# Stage 1: Встановлення залежностей та збірка
FROM node:24-alpine AS builder
WORKDIR /app

# Копіюємо package.json та lock-файл для встановлення залежностей
COPY package.json package-lock.json ./
RUN npm ci --frozen-lockfile

# Копіюємо весь код проєкту
COPY . .

# Збираємо проект у папку dist
RUN npm run build

# Stage 2: Фінальний образ для запуску
FROM nginx:alpine AS runner
WORKDIR /usr/share/nginx/html

# Копіюємо зібрані файли зі Stage 1
COPY --from=builder /app/dist .

# Копіюємо кастомний конфіг Nginx (опціонально)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Виставляємо порт для контейнера
EXPOSE 80

# Nginx стартує автоматично при запуску контейнера
CMD ["nginx", "-g", "daemon off;"]
# Chọn base image
FROM node:alpine

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Copy package.json và package-lock.json (nếu có)
COPY package*.json ./

# Cài đặt các dependencies
RUN npm install

# Copy toàn bộ mã nguồn vào trong container
COPY . .

# Build ứng dụng Docusaurus
RUN npm run build

# Cài đặt serve nếu cần
RUN npm install -g serve

# Chạy ứng dụng sử dụng serve
CMD ["serve", "-s", "build", "-l", "3000"]
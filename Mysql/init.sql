-- Tạo database (phòng khi Docker chạy lại)
CREATE DATABASE IF NOT EXISTS laravel CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE laravel;

-- Users
CREATE TABLE IF NOT EXISTS users (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

-- Sessions (tránh lỗi sessions table)
CREATE TABLE IF NOT EXISTS sessions (
  id VARCHAR(255) PRIMARY KEY,
  user_id BIGINT UNSIGNED NULL,
  ip_address VARCHAR(45) NULL,
  user_agent TEXT NULL,
  payload LONGTEXT NOT NULL,
  last_activity INT NOT NULL
);

-- Ví dụ bảng khác (cho thấy có cấu trúc DB)
CREATE TABLE IF NOT EXISTS posts (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  content TEXT,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

-- Seed demo
INSERT INTO users (name, email, password)
VALUES ('Demo User', 'demo@example.com', '$2y$10$abcdefghijklmnopqrstuv');

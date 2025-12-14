
CREATE DATABASE IF NOT EXISTS chama_system;
USE chama_system;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  phone VARCHAR(20) UNIQUE,
  password VARCHAR(255),
  role ENUM('admin','member') DEFAULT 'member',
  status ENUM('active','inactive') DEFAULT 'active',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, phone, password, role)
VALUES ('System Admin','0703107121','$2b$12$C73zeFxtjQ8ZLo2A30g8QuOBVKBfv.Xp8izRV6T9IF59Ximi4SdBK','admin');

CREATE TABLE settings (
  id INT PRIMARY KEY,
  monthly_contribution DECIMAL(10,2),
  penalty_amount DECIMAL(10,2),
  due_day INT
);

INSERT INTO settings VALUES (1, 450, 100, 5);

CREATE TABLE contributions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  month INT,
  year INT,
  amount DECIMAL(10,2),
  due_date DATE,
  paid_date DATE,
  status ENUM('PAID_ON_TIME','PAID_LATE','NOT_PAID')
);

CREATE TABLE penalties (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  contribution_id INT,
  amount DECIMAL(10,2),
  reason VARCHAR(255),
  date_applied DATE
);

CREATE TABLE loans (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  amount DECIMAL(10,2),
  interest DECIMAL(5,2),
  total_payable DECIMAL(10,2),
  issued_date DATE,
  duration_months INT,
  balance DECIMAL(10,2),
  status ENUM('active','cleared')
);

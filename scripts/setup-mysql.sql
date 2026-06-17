-- FiveM QBCore — güvenli MySQL kullanıcısı
-- Çalıştırma (root ile): mysql -u root -p < scripts/setup-mysql.sql
-- ÖNCE: DB adını, kullanıcı adını ve şifreyi değiştirin.

CREATE DATABASE IF NOT EXISTS `QBCore_2F0666`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS 'fivem'@'localhost' IDENTIFIED BY 'DEGISTIR_GUCLU_SIFRE';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, INDEX, DROP
  ON `QBCore_2F0666`.*
  TO 'fivem'@'localhost';

FLUSH PRIVILEGES;

-- server.cfg connection string örneği:
-- mysql://fivem:DEGISTIR_GUCLU_SIFRE@localhost/QBCore_2F0666?charset=utf8mb4

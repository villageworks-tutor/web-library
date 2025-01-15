-- データベースとユーザの削除
DROP DATABASE IF EXISTS weblibrarydb;
DROP USER IF EXISTS weblibraryusr;
-- データベースとユーザの作成
CREATE DATABASE weblibrarydb CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON weblibrarydb.* TO 'weblibraryusr'@'localhost' IDENTIFIED BY 'himitu';
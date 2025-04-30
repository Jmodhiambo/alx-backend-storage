-- Creating database holberton if it does not exist.

CREATE DATABASE IF NOT EXISTS holberton;
USE holberton;

-- Creating table users if it does not exist.
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255)
);

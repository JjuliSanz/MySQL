DROP DATABASE IF EXISTS instagram;

CREATE DATABASE instagram;

USE instagram;

CREATE TABLE users (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE profiles (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  username VARCHAR(255) NOT NULL UNIQUE,
  profile_picture VARCHAR(255) NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE follows (
  profile_id INT UNSIGNED NOT NULL,
  following_profile_id INT UNSIGNED NOT NULL,

  PRIMARY KEY (profile_id, following_profile_id),

  FOREIGN KEY (profile_id) REFERENCES profiles(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

  FOREIGN KEY (following_profile_id) REFERENCES profiles(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE posts (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  profile_id INT UNSIGNED NOT NULL,
  description VARCHAR(512) NULL,
  date DATETIME NOT NULL,

  FOREIGN KEY (profile_id) REFERENCES profiles(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE posts_images (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  post_id INT UNSIGNED NOT NULL,
  url VARCHAR(255) NOT NULL UNIQUE,

  FOREIGN KEY (post_id) REFERENCES posts(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE posts_comments (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  profile_id INT UNSIGNED NOT NULL,
  post_id INT UNSIGNED NOT NULL,
  date DATETIME NOT NULL,
  comment VARCHAR(512) NOT NULL,

  FOREIGN KEY (profile_id) REFERENCES profiles(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

  FOREIGN KEY (post_id) REFERENCES posts(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
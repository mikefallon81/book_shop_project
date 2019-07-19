DROP TABLE authors;
DROP TABLE genres;
DROP TABLE publishers;
DROP TABLE products;

CREATE TABLE products(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  genre
  ISBN VARCHAR(255),
  date_published DATE,
  current_stock INT4,
  minimum_stock INT4,
  trade_price FLOAT,
  retail_price FLOAT,
  publisher_id INT4 REFERENCES publishers(id),
  author_id INT4 REFERENCES authors(id),
  genre_id INT4 REFERENCES genre(id)
);

CREATE TABLE publishers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  street VARCHAR(255),
  city VARCHAR(255),
  postcode VARCHAR(255),
  phone INT4,
  email VARCHAR(255)
);

CREATE TABLE authors(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE genres(
  id SERIAL4 PRIMARY KEY,
  genre_type VARCHAR(255)
);

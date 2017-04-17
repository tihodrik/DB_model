drop table if exists book_author;
drop table if exists book_shop;
drop table if exists book_publisher;
drop table if exists book;
drop table if exists author;
drop table if exists genre;
drop table if exists publisher;
drop table if exists shop;


CREATE TABLE author (
    author_id INT UNSIGNED AUTO_INCREMENT,
    author_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    PRIMARY KEY (author_id)
)CHARACTER SET = UTF8;

CREATE TABLE genre (
    genre_id INT UNSIGNED AUTO_INCREMENT,
    genre VARCHAR(50) NOT NULL,
    PRIMARY KEY (genre_id)
)CHARACTER SET = UTF8;

CREATE TABLE publisher (
    publisher_id INT UNSIGNED AUTO_INCREMENT,
    publisher VARCHAR(50) NOT NULL,
    publisher_country VARCHAR(50) NOT NULL,
    publisher_city VARCHAR(50) NOT NULL,
    publisher_street VARCHAR(50) NOT NULL,
    pubblisher_mail VARCHAR(50),
    pubblisher_website VARCHAR(50),
    PRIMARY KEY (publisher_id)
)CHARACTER SET = UTF8;

CREATE TABLE shop (
    shop_id INT UNSIGNED AUTO_INCREMENT,
    shop_name VARCHAR(50) NOT NULL,
    shop_country VARCHAR(50) NOT NULL,
    shop_city VARCHAR(50) NOT NULL,
    shop_street VARCHAR(50) NOT NULL,
    shop_mail VARCHAR(50),
    shop_website VARCHAR(50),
    PRIMARY KEY (shop_id)
)CHARACTER SET = UTF8;

CREATE TABLE book (
    ISBN VARCHAR(13) NOT NULL,
    title VARCHAR(50) NOT NULL,
    genre_id INT UNSIGNED NOT NULL,
    publisher_id INT UNSIGNED NOT NULL,
    publication_year YEAR(4) NOT NULL,
    publication_language VARCHAR(20) NOT NULL,
    pages INT UNSIGNED NOT NULL,
    weight INT UNSIGNED NOT NULL,
    copies INT UNSIGNED NOT NULL,
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id),
    PRIMARY KEY (ISBN)
)CHARACTER SET = UTF8;

CREATE TABLE book_shop (
	shop_id INT UNSIGNED NOT NULL,
    ISBN VARCHAR(13) NOT NULL,    
    copies INT UNSIGNED,
    cost FLOAT UNSIGNED NOT NULL,
    FOREIGN KEY (ISBN) REFERENCES book(ISBN),
    FOREIGN KEY (shop_id) REFERENCES shop(shop_id),
    PRIMARY KEY (ISBN, shop_id)
)CHARACTER SET = UTF8;

CREATE TABLE book_author (
    ISBN VARCHAR(13) NOT NULL,
    author_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ISBN) REFERENCES book(ISBN),
    FOREIGN KEY (author_id) REFERENCES author(author_id),
    PRIMARY KEY (ISBN, author_id)    
)CHARACTER SET = UTF8;
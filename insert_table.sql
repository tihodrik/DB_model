#чтобы незаполненное значение в файле (пустая строчка) считалась как NULL, или false-значением
SET SESSION sql_mode = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

LOAD DATA LOCAL INFILE 'C:\\Users\\Darya Tikhomirova\\Desktop\\tables\\author.txt' REPLACE INTO TABLE author 
CHARACTER SET cp1251;

LOAD DATA LOCAL INFILE 'C:\\Users\\Darya Tikhomirova\\Desktop\\tables\\genre.txt' REPLACE INTO TABLE genre 
CHARACTER SET cp1251;

LOAD DATA LOCAL INFILE 'C:\\Users\\Darya Tikhomirova\\Desktop\\tables\\publisher.txt' REPLACE INTO TABLE publisher 
CHARACTER SET cp1251;

LOAD DATA LOCAL INFILE 'C:\\Users\\Darya Tikhomirova\\Desktop\\tables\\shop.txt' REPLACE INTO TABLE shop 
CHARACTER SET cp1251;

LOAD DATA LOCAL INFILE 'C:\\Users\\Darya Tikhomirova\\Desktop\\tables\\book.txt' REPLACE INTO TABLE book 
CHARACTER SET cp1251;

LOAD DATA LOCAL INFILE 'C:\\Users\\Darya Tikhomirova\\Desktop\\tables\\book_shop.txt' REPLACE INTO TABLE book_shop 
CHARACTER SET cp1251;

LOAD DATA LOCAL INFILE 'C:\\Users\\Darya Tikhomirova\\Desktop\\tables\\book_author.txt' REPLACE INTO TABLE book_author 
CHARACTER SET cp1251;
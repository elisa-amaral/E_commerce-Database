CREATE DATABASE ecommerce
CHARACTER SET utf8 COLLATE utf8_general_ci;

use ecommerce;

CREATE TABLE products(
	product_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	product VARCHAR(200) NOT NULL,
	price FLOAT(8,2) NOT NULL
);

CREATE TABLE product_descriptions(
	description_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	product_id_fk INT NOT NULL, 
	description_text TEXT NOT NULL,
	FOREIGN KEY(product_id_fk) REFERENCES products(product_id)
);

CREATE TABLE images(
    image_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    product_id_fk INT NOT NULL,
    image_url VARCHAR(200) NOT NULL,
    FOREIGN KEY(product_id_fk) REFERENCES products(product_id)
);

CREATE TABLE customers(
    customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT(3) NOT NULL
);

CREATE TABLE orders(
    order_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id_fk INT NOT NULL, 
    FOREIGN KEY(customer_id_fk) REFERENCES customers(customer_id),
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders_and_products(
    product_id_fk INT NOT NULL,
    order_id_fk INT NOT NULL,
    FOREIGN KEY(product_id_fk) REFERENCES products(product_id),
    FOREIGN KEY(order_id_fk) REFERENCES orders(order_id)
);

INSERT INTO products(product, price) VALUES ('Ultrathin Dell Inspiron Laptop with  Intel Core i7 , 16GB RAM and 240GB SSD', 950.00);
INSERT INTO products(product, price) VALUES ('Samsung 40 inches Full HD LED  Smart TV  with 2 HDMI, 1 USB and Integrated Wi-Fi ', 900.54);
INSERT INTO products(product, price) VALUES ('Dual Chip LG K10 Smartphone with Android 7.0, 4G Wi-Fi nd 13MP Camera', 350.99);


INSERT INTO product_descriptions(product_id_fk, description_text) VALUES (1, 'The new Dell Inspiron offers a sleek design and infinite display that amplifies your senses while maintaining sophistication and compact measurements...');
INSERT INTO product_descriptions(product_id_fk, description_text) VALUES (2, 'Samsung Smart TV has a 40 onches screen and offers Full HD resolution, images twice as good as standard HD TVs...');
INSERT INTO product_descriptions(product_id_fk, description_text) VALUES (3, "The LG smartphone offers an engaging mobile experience, it's fast, easy to use great for taking selfies and features an amazing 5.3 inches HD screen...");


INSERT INTO images(product_id_fk, image_url) VALUES (1, 'c:/path/notebook_image_1.jpg'),(1, 'c:/path/notebook_image_2.jpg'),(1, 'c:/path/notebook_image_3.jpg');
INSERT INTO images(product_id_fk, image_url) VALUES (2, 'c:/path/smartTV_image_1.jpg'),(2, 'c:/path/smartTV_image_2.jpg');                                                                               
INSERT INTO images(product_id_fk, image_url) VALUES (3, 'c:/path/smartphone_img_1.jpg');


INSERT INTO customers(name, age) VALUES ('Peter',33);
INSERT INTO customers(name, age) VALUES ('Eleanor',25); 
INSERT INTO orders(customer_id_fk) VALUES (1);
INSERT INTO orders(customer_id_fk) VALUES (1); 
INSERT INTO orders(customer_id_fk) VALUES (2);


INSERT INTO orders_and_products(order_id_fk, product_id_fk) VALUES (1,2); 
INSERT INTO orders_and_products(order_id_fk, product_id_fk) VALUES (1,3); 
INSERT INTO orders_and_products(order_id_fk, product_id_fk) VALUES (2,3);
INSERT INTO orders_and_products(order_id_fk, product_id_fk) VALUES (3,1); 
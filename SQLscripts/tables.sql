
create database pet_store;

use pet_store;

CREATE TABLE Role (
    role_id INT AUTO_INCREMENT,
    role_name VARCHAR(55) NOT NULL,
    PRIMARY KEY (role_id)
);

CREATE TABLE Worker (
    worker_id INT AUTO_INCREMENT,
    role_id INT,
    work_fname VARCHAR(55) NOT NULL,
    work_lname VARCHAR(55) NOT NULL,
    work_phone VARCHAR(10) NOT NULL,
    work_address VARCHAR(55) NOT NULL,
    PRIMARY KEY (worker_id),
    FOREIGN KEY (role_id)
        REFERENCES Role (role_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Pet_type (
    pet_type_id INT AUTO_INCREMENT,
    pet_type_name VARCHAR(55) NOT NULL,
    PRIMARY KEY (pet_type_id)
);

CREATE TABLE Pet (
    pet_id INT AUTO_INCREMENT,
    pet_type_id INT,
    pet_name VARCHAR(55) NOT NULL,
    pet_age FLOAT NOT NULL,
    PRIMARY KEY (pet_id),
    FOREIGN KEY (pet_type_id)
        REFERENCES Pet_type (pet_type_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Customer (
    cust_id INT AUTO_INCREMENT,
    cust_fname VARCHAR(55) NOT NULL,
    cust_lname VARCHAR(55) NOT NULL,
    cust_phone VARCHAR(10) NOT NULL,
    cust_address VARCHAR(55) NOT NULL,
    PRIMARY KEY (cust_id)
);

CREATE TABLE Customer_pet (
    cust_id INT,
    pet_id INT,
    PRIMARY KEY (cust_id , pet_id),
    FOREIGN KEY (cust_id)
        REFERENCES Customer (cust_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (pet_id)
        REFERENCES Pet (pet_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Prod_catagory (
    cat_id INT AUTO_INCREMENT,
    cat_name VARCHAR(55),
    PRIMARY KEY (cat_id)
);

-- CHANGE

CREATE TABLE Product (
    prod_id INT AUTO_INCREMENT,
    prod_name VARCHAR(55) NOT NULL,
    cat_id INT,
    prod_desc VARCHAR(200) NOT NULL,
    prod_price FLOAT NOT NULL,
    prod_quant INT NOT NULL,
    CHECK (prod_price >= 0),
    CHECK (prod_quant >= 0),
    PRIMARY KEY (prod_id),
    FOREIGN KEY (cat_id)
        REFERENCES Prod_catagory (cat_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
 
 -- END CHANGE


CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT,
    worker_id INT DEFAULT (2),
    cust_id INT,
	ord_total_price FLOAT NOT NULL DEFAULT (0),
    ord_time DATETIME NOT NULL,
    ord_act bit default(1),
        PRIMARY KEY (order_id),
    FOREIGN KEY (cust_id)
        REFERENCES Customer (cust_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);



-- CHANGE 
CREATE TABLE Delivery (
    delivery_id INT AUTO_INCREMENT,
    worker_id INT,
    order_id INT,
    delivery_date DATETIME NOT NULL,
    delivery_price FLOAT DEFAULT (15),
    delivery_sent BIT DEFAULT (0),
    CHECK (delivery_price >= 0),
    PRIMARY KEY (delivery_id),
    FOREIGN KEY (worker_id)
        REFERENCES Worker (worker_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (order_id)
        REFERENCES Orders (order_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
-- END CHANGE


-- CHANGE

CREATE TABLE Orders_Products (
    order_id INT,
    prod_id INT,
    prod_ord_quant INT NOT NULL,
    CHECK (prod_ord_quant >= 1),
    PRIMARY KEY (order_id , prod_id),
    FOREIGN KEY (order_id)
        REFERENCES Orders (order_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (prod_id)
        REFERENCES Product (prod_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
    
-- END CHANGE    

CREATE TABLE Storage_log (
    order_id INT,
    prod_id INT,
    old_quant INT NOT NULL,
    new_quant INT NOT NULL,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (order_id , prod_id),
    FOREIGN KEY (order_id)
        REFERENCES Orders (order_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (prod_id)
        REFERENCES Product (prod_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


    
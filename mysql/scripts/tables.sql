# DROP TABLE users;

CREATE TABLE IF NOT EXISTS user (
       id int,
       LastName varchar(255),
       FirstName varchar(255)
);

CREATE TABLE `order` (
       id int,
       user_id int,
       sum float
);

CREATE TABLE order_item (
        id int,
        order_id int,
        price float
);

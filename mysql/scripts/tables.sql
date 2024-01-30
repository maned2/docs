# 1.1 DELETE TABLE
DROP TABLE user;
DROP TABLE `order`;
DROP TABLE order_item;

# 1.2 CREATE TABLE
CREATE TABLE IF NOT EXISTS user (
       id int PRIMARY KEY,
       last_name varchar(255),
       first_name varchar(255),
       created_at datetime DEFAULT CURRENT_TIMESTAMP,
       updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `order` (
       id int PRIMARY KEY,
       user_id int,
       sum float
);

CREATE TABLE order_item (
        id int PRIMARY KEY,
        order_id int,
        price float
);

# 2. add remove COLUMN
ALTER TABLE user ADD email varchar(255);
ALTER TABLE user DROP COLUMN email;

# 3. CONSTRAINTS
# 3.1 NOT NULL - Ensures that a column cannot have a NULL value

# use cases:
# 3.1.1 add not null when column have null values
DROP TABLE IF EXISTS test_not_null;
CREATE TABLE IF NOT EXISTS test_not_null (
       id int PRIMARY KEY AUTO_INCREMENT,
       user_id int,
       sum float
);
INSERT INTO test_not_null (user_id, sum) VALUES
                                             (1, 150),
                                             (2, 50);
INSERT INTO test_not_null (sum) VALUES (200);
ALTER TABLE test_not_null MODIFY user_id int NOT NULL;
# we will receive error: [22001][1138] Data truncation: Invalid use of NULL value

# 3.2 UNIQUE - Ensures that all values in a column are different
# can be deleted:
# ALTER TABLE user DROP INDEX last_first_name;

# use cases:
# 3.2.1 add UNIQUE when column have not unique values
DROP TABLE IF EXISTS test_unique;
CREATE TABLE IF NOT EXISTS test_unique (
                                             id int PRIMARY KEY AUTO_INCREMENT,
                                             user_id int,
                                             sum float
);
INSERT INTO test_unique (user_id, sum) VALUES
                                            (1, 150),
                                            (2, 50),
                                            (2, 350);
ALTER TABLE test_unique ADD UNIQUE (user_id);
# as expected, we received error [23000][1062] Duplicate entry '2' for key 'test_unique.user_id'

# 3.3 PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
# UNIQUE, PRIMARY KEY can be complex - by to or more rows
# ALTER TABLE user ADD CONSTRAINT first_last_name PRIMARY KEY (first_name, last_name);

# 3.4 FOREIGN KEY - Prevents actions that would destroy links between tables
ALTER TABLE `order` ADD CONSTRAINT FK_user_order FOREIGN KEY (user_id) REFERENCES user(id);
# how delete:
# ALTER TABLE `order` DROP FOREIGN KEY fk_user_order;


# 3.5 CHECK - Ensures that the values in a column satisfies a specific condition
# ALTER TABLE user ADD CONSTRAINT CHK_user_age CHECK (age>=18 AND city='Moscow');

# 3.6 DEFAULT - Sets a default value for a column if no value is specified
# ALTER TABLE `order` ALTER sum SET DEFAULT 0;

# use cases:
# 3.6.1 set default value when exist null fields

DROP TABLE IF EXISTS test_default;
CREATE TABLE IF NOT EXISTS test_default (
                                           id int PRIMARY KEY AUTO_INCREMENT,
                                           user_id int,
                                           sum float
);
INSERT INTO test_default (user_id, sum) VALUES
                                           (1, null),
                                           (2, 50),
                                           (2, 350);
ALTER TABLE test_default ALTER sum SET DEFAULT 0;
# it works. values still null

# CREATE INDEX - Used to create and retrieve data from the database very quickly

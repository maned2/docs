# create example
CREATE TABLE persons (
                         Personid int NOT NULL AUTO_INCREMENT,
                         LastName varchar(255) NOT NULL,
                         FirstName varchar(255),
                         Age int,
                         PRIMARY KEY (Personid)
);

# modify increment to start from another count;
ALTER TABLE persons AUTO_INCREMENT=100;

# use cases: can we create column with auto increment starts from another count?
CREATE TABLE test_increment (
                         id int NOT NULL AUTO_INCREMENT=123,
                         name varchar(255),
                         PRIMARY KEY (id)
);
# no, we get sql error:
# [42000][1064] You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '=123,
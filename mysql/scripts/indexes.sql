#create index
CREATE INDEX index_name ON table_name (column1, column2, ...);
# create unique index
CREATE UNIQUE INDEX index_name ON table_name (column1, column2, ...);
# use case: create unique index when we have not unique values;
DROP TABLE IF EXISTS test_index_unique;
CREATE TABLE IF NOT EXISTS test_index_unique (
                                            id int PRIMARY KEY AUTO_INCREMENT,
                                            user_id int,
                                            sum float
);
INSERT INTO test_index_unique (user_id, sum) VALUES
                                            (1, null),
                                            (2, 50),
                                            (2, 350),
                                            (2,50);
CREATE UNIQUE INDEX idx_test_index_unique_user_sum ON test_index_unique (user_id, sum);
# we got error: Duplicate entry '2-50' for key 'test_index_unique.idx_test_index_unique_user_sum'

# drop index
ALTER TABLE table_name DROP INDEX index_name;
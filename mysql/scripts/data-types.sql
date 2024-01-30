# 1. CHAR(size) - a FIXED length string, size from 0 to 255
CREATE TABLE test_data_type_char (
                                t_char CHAR(255) # length in characters
);

# use case: can we create a column with length 0?
CREATE TABLE test_data_type_char ( t_char CHAR(0));
# yes
# can we insert string?
INSERT INTO test_data_type_char (t_char) VALUES ('a');
# no, we got error: [22001][1406] Data truncation: Data too long for column 't_char' at row 1
# but we can insert empty string?
INSERT INTO test_data_type_char (t_char) VALUES ('');
# yes

# 2. VARCHAR(size) - a VARIABLE string, size from 0 to 65535. no default? lets test:
CREATE TABLE test_data_type_varchar (
    t_varchar VARCHAR()
);
# we got errors. we NEED specify max size

# 3. BINARY(size) - equal to CHAR but store bytes byte strings., size in
# 4. VARBINARY(size) - equal to VARCHAR
# 5. TINYBLOB - For BLOBs (Binary Large Objects). Max length: 255 bytes
# 6. TINYTEXT - Holds a string with a maximum length of 255 characters
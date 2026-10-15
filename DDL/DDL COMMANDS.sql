-- To Create a Database
CREATE DATABASE sales;

-- To Create a Table
Use sales;
CREATE TABLE stores
(
 store_id INT,
 store_name varchar(200)
 );
  
-- Insert Records
INSERT INTO stores
VALUES
(1,"XYZ"),
(2,("ABC"));


-- Containt for Tables
CREATE TABLE new_store
(
 Store_id INT UNIQUE,
 Store_name VARCHAR(200) NOT NULL
 )

INSERT INTO new_store
VALUES
(1,"PQR"),
(2,"MNO");


-- Delete the Tables
DROP TABLE new_store;    -- it Will Delete Entire TAble With Column also
TRUNCATE TABLE stores;   -- it will only Delete Column's Data but not the Table

-- ALTER command
CREATE TABLE medical
(
 Store_id INT UNIQUE,
 Store_name VARCHAR(200) NOT NULL
 )

INSERT INTO medical
VALUES
(1,"Zee"),
(2,"Ree");

ALTER TABLE medical
ADD COLUMN
store_city VARCHAR(200) 
;

ALTER TABLE medical
RENAME COLUMN 
store_city TO Store_location
;







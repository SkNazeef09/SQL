# SQL Notes: Database, Tables, Constraints, and ALTER Commands

A beginner-friendly guide to the fundamentals of SQL using **MySQL**. It covers creating databases and tables, inserting data, applying constraints, removing data, and modifying table structure.

> **Tested on:** MySQL 8.0+ (`RENAME COLUMN` requires MySQL 8.0 or later).

---

## Table of Contents

1. [Create a Database](#1-create-a-database)
2. [Create a Table](#2-create-a-table)
3. [Insert Records](#3-insert-records)
4. [Constraints in SQL](#4-constraints-in-sql)
5. [DROP vs TRUNCATE vs DELETE](#5-drop-table-vs-truncate-table-vs-delete)
6. [ALTER TABLE Command](#6-alter-table-command)
7. [Quick Revision](#7-quick-revision-important-sql-commands)
8. [Common Mistakes to Avoid](#8-common-mistakes-to-avoid)
9. [Practice Exercise](#9-practice-exercise)
10. [Summary](#summary)

---

## 1. Create a Database

The `CREATE DATABASE` command creates a new database.

```sql
CREATE DATABASE sales;
```

Select the database so later commands run inside it:

```sql
USE sales;
```

| Command | Meaning |
|---------|---------|
| `CREATE DATABASE` | Creates a new database. |
| `sales` | The database name. |
| `USE sales` | Selects the database for subsequent operations. |

**Useful extras:**

```sql
CREATE DATABASE IF NOT EXISTS sales;  -- avoids an error if it already exists
SHOW DATABASES;                       -- lists all databases
DROP DATABASE sales;                  -- deletes the database (permanent!)
```

---

## 2. Create a Table

The `CREATE TABLE` command creates a table with specified columns and data types.

```sql
CREATE TABLE stores
(
    store_id INT,
    store_name VARCHAR(200)
);
```

| Syntax | Meaning |
|--------|---------|
| `CREATE TABLE` | Creates a new table. |
| `stores` | The table name. |
| `INT` | Stores integer values. |
| `VARCHAR(200)` | Stores variable-length text up to 200 characters. |

> **Key concept:** A table is made of **rows** (records) and **columns** (fields).

```sql
SHOW TABLES;   -- lists all tables in the current database
```

---

## 3. Insert Records

The `INSERT INTO` command adds new rows to a table.

```sql
INSERT INTO stores
VALUES
(1, 'XYZ'),
(2, 'ABC');
```

- Each set of parentheses is **one row**.
- When column names are omitted, values must follow the **order of the table's columns**.
- Multiple rows can be inserted in a single statement.
- Use **single quotes** for text values.

**Recommended:** list the column names explicitly. It is safer if the table structure changes later.

```sql
INSERT INTO stores (store_id, store_name)
VALUES (3, 'LMN');
```

View the records:

```sql
SELECT * FROM stores;
```

**Expected output (after the first insert):**

| store_id | store_name |
|----------|------------|
| 1 | XYZ |
| 2 | ABC |

---

## 4. Constraints in SQL

Constraints are rules applied to columns to maintain **data accuracy and integrity**.

```sql
CREATE TABLE new_store
(
    Store_id INT UNIQUE,
    Store_name VARCHAR(200) NOT NULL
);
```

### Common Constraints

| Constraint | Description |
|------------|-------------|
| `UNIQUE` | Prevents duplicate non-NULL values in a column. |
| `NOT NULL` | Prevents a column from containing NULL values. |
| `PRIMARY KEY` | Uniquely identifies each row. Combines `UNIQUE` + `NOT NULL`. Only one per table. |
| `DEFAULT` | Sets a default value when none is supplied. |

Insert records:

```sql
INSERT INTO new_store
VALUES
(1, 'PQR'),
(2, 'MNO');
```

**Important points:**

- Store IDs must be unique.
- Store names cannot be `NULL`.
- A `UNIQUE` constraint does **not** automatically make a column `NOT NULL`. In MySQL, a `UNIQUE` column can hold multiple `NULL` values.

### Example: Constraint Violations

```sql
INSERT INTO new_store VALUES (1, 'DUP');   -- ERROR: duplicate value for Store_id
INSERT INTO new_store VALUES (3, NULL);    -- ERROR: Store_name cannot be NULL
```

### Example: PRIMARY KEY and DEFAULT

```sql
CREATE TABLE products
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    status VARCHAR(20) DEFAULT 'active'
);
```

---

## 5. DROP TABLE vs TRUNCATE TABLE vs DELETE

SQL provides different commands for removing tables and their records.

### A. `DROP TABLE`

Deletes the **entire table**, including its structure and data.

```sql
DROP TABLE new_store;
```

- Deletes all records.
- Removes the table structure and columns.
- The table no longer exists.

### B. `TRUNCATE TABLE`

Removes **all records** but keeps the table structure.

```sql
TRUNCATE TABLE stores;
```

- Deletes all records.
- Keeps the table and its columns.
- Does **not** support a `WHERE` clause.
- Resets `AUTO_INCREMENT` counters.

### C. `DELETE` (for comparison)

Removes **selected** (or all) rows and supports a `WHERE` clause.

```sql
DELETE FROM stores WHERE store_id = 1;
```

### Comparison

| Feature | `DROP TABLE` | `TRUNCATE TABLE` | `DELETE` |
|---------|:------------:|:----------------:|:--------:|
| Deletes records | Yes | Yes (all) | Yes (all or selected) |
| Deletes table structure | Yes | No | No |
| Table remains available | No | Yes | Yes |
| Supports `WHERE` | No | No | Yes |

> **Memory trick:**
> - `DROP` removes the table.
> - `TRUNCATE` empties the table.
> - `DELETE` removes chosen rows.

> **Warning:** These commands can remove data permanently. Take a backup and use them carefully.

---

## 6. ALTER TABLE Command

The `ALTER TABLE` command modifies the structure of an existing table.

### Create the `medical` table

```sql
CREATE TABLE medical
(
    Store_id INT UNIQUE,
    Store_name VARCHAR(200) NOT NULL
);

INSERT INTO medical
VALUES
(1, 'Zee'),
(2, 'Ree');
```

### A. Add a new column

```sql
ALTER TABLE medical
ADD COLUMN store_city VARCHAR(200);
```

- Adds a column named `store_city`.
- The new column allows `NULL` values by default.
- Existing rows will initially contain `NULL` in this column.

### B. Rename a column

```sql
ALTER TABLE medical
RENAME COLUMN store_city TO Store_location;
```

- Changes `store_city` to `Store_location`.
- Existing column data is preserved.

### C. Change a column's data type

```sql
ALTER TABLE medical
MODIFY COLUMN Store_location VARCHAR(100);
```

### D. Drop a column

```sql
ALTER TABLE medical
DROP COLUMN Store_location;
```

### E. Rename a table

```sql
ALTER TABLE medical
RENAME TO pharmacy;
```

### F. View table structure

```sql
DESCRIBE medical;
```

Shows columns, data types, nullability, and keys.

### G. View table data

```sql
SELECT * FROM medical;
```

### ALTER TABLE Cheat Sheet

| Task | Syntax |
|------|--------|
| Add column | `ALTER TABLE t ADD COLUMN c datatype;` |
| Rename column | `ALTER TABLE t RENAME COLUMN old TO new;` |
| Change data type | `ALTER TABLE t MODIFY COLUMN c datatype;` |
| Drop column | `ALTER TABLE t DROP COLUMN c;` |
| Rename table | `ALTER TABLE old RENAME TO new;` |

---

## 7. Quick Revision: Important SQL Commands

| Command | Purpose |
|---------|---------|
| `CREATE DATABASE` | Creates a database. |
| `USE` | Selects the active database. |
| `SHOW DATABASES` / `SHOW TABLES` | Lists databases / tables. |
| `CREATE TABLE` | Creates a table. |
| `INSERT INTO` | Inserts records. |
| `UNIQUE` | Prevents duplicate non-NULL values. |
| `NOT NULL` | Prevents NULL values. |
| `PRIMARY KEY` | Uniquely identifies each row. |
| `DROP TABLE` | Deletes a table and its structure. |
| `TRUNCATE TABLE` | Removes all records but retains the structure. |
| `DELETE` | Removes selected records. |
| `ALTER TABLE` | Modifies table structure. |
| `ADD COLUMN` | Adds a new column. |
| `RENAME COLUMN` | Renames an existing column. |
| `DESCRIBE` | Displays table structure. |
| `SELECT *` | Retrieves all columns and rows. |

---

## 8. Common Mistakes to Avoid

| Mistake | Fix |
|---------|-----|
| Missing semicolons | End every SQL statement with `;`. |
| Extra parentheses | Use `(2, 'ABC')`, not `(2, ('ABC'))`. |
| Wrong database | Run `USE sales;` before creating tables that should belong to `sales`. |
| Duplicate values | Inserting a duplicate non-NULL value into a `UNIQUE` column causes an error. |
| NULL values | A `NOT NULL` column requires a value. |
| Dropping tables | After `DROP TABLE`, recreate the table before inserting records again. |
| Truncating data | `TRUNCATE TABLE` removes **all** records, not selected ones. |
| Double quotes for text | Prefer single quotes: `'ABC'`. |
| Older MySQL versions | `RENAME COLUMN` needs MySQL 8.0+. Older versions use `CHANGE old new datatype`. |

---

## 9. Practice Exercise

Try these tasks yourself:

1. Create a database named `college`.
2. Select the `college` database.
3. Create a table named `students` with `student_id` and `student_name`.
4. Insert two student records.
5. Add a `city` column using `ALTER TABLE`.
6. Rename `city` to `student_city`.
7. View the table structure using `DESCRIBE`.
8. View all records using `SELECT *`.

### Example Solution

```sql
CREATE DATABASE college;

USE college;

CREATE TABLE students
(
    student_id INT UNIQUE,
    student_name VARCHAR(200) NOT NULL
);

INSERT INTO students
VALUES
(1, 'Aman'),
(2, 'Riya');

ALTER TABLE students
ADD COLUMN city VARCHAR(100);

ALTER TABLE students
RENAME COLUMN city TO student_city;

DESCRIBE students;

SELECT * FROM students;
```

**Expected result of the final `SELECT`:**

| student_id | student_name | student_city |
|------------|--------------|--------------|
| 1 | Aman | NULL |
| 2 | Riya | NULL |

---

## Summary

In this lesson, we covered:

- Database and table creation
- Inserting records into tables
- Constraints such as `UNIQUE`, `NOT NULL`, `PRIMARY KEY`, and `DEFAULT`
- Differences between `DROP`, `TRUNCATE`, and `DELETE`
- Modifying table structures using `ALTER TABLE`
- Viewing table structures and records

> **Tip:** Practice each command in MySQL and check the results using `SELECT *` and `DESCRIBE`. Repeated practice builds both syntax memory and understanding.

---

## Contributing

Suggestions and corrections are welcome. Feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

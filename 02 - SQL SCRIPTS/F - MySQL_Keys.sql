-- Database Used in this Lab
-- The eBooks database has been used in this lab.


-- Objectives
-- After completing this lab, you will be able to use MySQL phpMyAdmin to:

-- Create primary and foreign keys.
-- Add constraints to data columns.

-- Exercise
-- In this exercise, you will learn how to add keys to create relationships between the tables and how to use constraints to enforce rules on the data entry in the MySQL database service using the phpMyAdmin graphical user interface (GUI) tool.

-- To start, download the the eBooks mysql dump file (containing the eBooks database table definitions and data) below to your local computer storage. A dump file is a text file that contains the data from a database in the form of SQL statements. This file can then be imported in phpMyAdmin.
-- [Download completed]



-- Go to the Import tab. Click Choose File and load the eBooksmysqldump.sql file you downloaded earlier to your local computer storage. Next, uncheck Enable foreign key checks and select SQL as Format. Then click Go.

-- You will be notified that the import has successfully finished. Click the database eBooks as shown below to expand (if necessary click the + icon beside eBooks). You will see the list of tables from the eBooks database.


-- Primary Keys: A primary key is a column or group of columns that uniquely identify every row in a table. They constrain the table by only accepting unique, non-NULL values for that column. Non-NULL data is data where the values exist.

-- Creating a primary key on a table automatically creates an index on the key. You will create a primary key for the author table to uniquely identify every row in the table. You will set the author_id column of the author table as a primary key.


-- sql command as follows:

ALTER TABLE `authors` ADD PRIMARY KEY( `author_id`);

-- Auto-increment: Auto-increment enables a unique number to be generated automatically when a new record is inserted into a table. Often this is used for the primary key field to be created automatically every time a new record is inserted. You will set the auto-increment feature for the primary key of the author table.

-- In the tree-view, click the authors table. Switch to the Structure tab and make sure you are inside the Table structure subtab.

-- Check the author_id column.

-- Click the Change option.

-- Check AI option (AI = Auto_Increment).

-- Click Save.


-- Null constraints: By default, a column can hold NULL values. If you do not want a column to have a NULL value, you can restrict the column from having a NULL value. You will restrict the first_name column of the authors table from having a NULL value.

-- In the tree-view, click the authors table. Switch to the Structure tab and make sure you are inside the Table structure subtab.
-- Check the first_name column.
-- Click the Change option.
-- Uncheck the Null option.
-- Click Save.

-- Foreign keys: A foreign key is a column that establishes a relationship between two tables. It acts as a cross-reference between two tables as it points to the primary key of one table (the parent table), constraining the data in another table (the child table) by the data in the parent table. You will create a foreign key for the bookauthors table by setting its authorid column as a foreign key, to establish a relationship between the book_authors and authors tables.

-- Foreign keys: A foreign key is a column that establishes a relationship between two tables. It acts as a cross-reference between two tables as it points to the primary key of one table (the parent table), constraining the data in another table (the child table) by the data in the parent table. You will create a foreign key for the bookauthors table by setting its authorid column as a foreign key, to establish a relationship between the book_authors and authors tables.

-- In the tree-view, click the book_authors table. Switch to the Structure tab and make sure you are inside the Relation view subtab.
-- If necessary, click Add constraint to create a new foreign key constraint placeholder.
-- Fill the placeholders as shown in a image below.
-- Click Save.

ALTER TABLE `book_authors` ADD CONSTRAINT `fk_author` FOREIGN KEY (`author_id`) REFERENCES `authors`(`author_id`) ON DELETE CASCADE ON UPDATE RESTRICT;


-- CASCADE means that when rows are deleted or updated in the parent table, the corresponding rows in the child table will also be deleted or updated.

-- RESTRICT means that rows cannot be deleted or updated in the parent table if there are corresponding rows in the child table.
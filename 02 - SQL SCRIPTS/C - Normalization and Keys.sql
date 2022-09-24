-- Excercise 1 - Normalization

-- A single/atomic value cannot be divided and does not include any delimiter character.
-- The outcome below is 4 
select count (distinct author_name) from bookshop; 
-- However, the outcome in the next line is 5:
select count (*) from bookshop;
-- And here, the outcome is also 5:
select count (distinct book_id) from bookshop;
-- Since book_id is the primary key, we understand that there is an author who made two books.
-- By definition, a table is in 1NF if every attribute in that relation contains single valued data and every tuple in that relation is unique. Does the above table fall in first normal form?
-- Answer: No, the table is not in 1NF since it has unique rows but not all single valued cell.
-- how can you normalize the table to ensure first normal form?
-- Answer: o normalize this table, add an extra row, and split the multiple author names as well as multiple author IDs of the row containing multi-valued data into their own row.


-- IBM instructions to proceed with the tutorials:
-- Drop the tables in case they exist

DROP TABLE BookShop;
DROP TABLE BookShop_AuthorDetails;

-- Create the table

CREATE TABLE BookShop (
	BOOK_ID VARCHAR(4) NOT NULL, 
	TITLE VARCHAR(100) NOT NULL, 
	AUTHOR_NAME VARCHAR(30) NOT NULL, 
	AUTHOR_BIO VARCHAR(250),
	AUTHOR_ID INTEGER NOT NULL, 
	PUBLICATION_DATE DATE NOT NULL, 
	PRICE_USD DECIMAL(6,2) CHECK(Price_USD>0) NOT NULL
	);

-- Insert sample data into the table

INSERT INTO BookShop VALUES
('B101', 'Introduction to Algorithms', 'Thomas H. Cormen', 'Thomas H. Cormen is the co-author of Introduction to Algorithms, along with Charles Leiserson, Ron Rivest, and Cliff Stein. He is a Full Professor of computer science at Dartmouth College and currently Chair of the Dartmouth College Writing Program.', 123 , '2001-09-01', 125),
('B201', 'Structure and Interpretation of Computer Programs', 'Harold Abelson', 'Harold Abelson, Ph.D., is Class of 1922 Professor of Computer Science and Engineering in the Department of Electrical Engineering and Computer Science at MIT and a fellow of the IEEE.', 456, '1996-07-25', 65.5),
('B301', 'Deep Learning', 'Ian Goodfellow', 'Ian J. Goodfellow is a researcher working in machine learning, currently employed at Apple Inc. as its director of machine learning in the Special Projects Group. He was previously employed as a research scientist at Google Brain.', 369, '2016-11-01', 82.7),
('B401', 'Algorithms Unlocked', 'Thomas H. Cormen', 'Thomas H. Cormen is the co-author of Introduction to Algorithms, along with Charles Leiserson, Ron Rivest, and Cliff Stein. He is a Full Professor of computer science at Dartmouth College and currently Chair of the Dartmouth College Writing Program.', 123, '2013-05-15', 36.5),
('B501', 'Machine Learning: A Probabilistic Perspective', 'Kevin P. Murphy', '', 157, '2012-08-24', 46);

-- Retrieve all records from the table

SELECT * FROM BookShop;

--"By definition, a relation is in second normal form if it is already in 1NF and does not contain any partial dependencies. If you look at the BookShop table, you will find every column in the table is single or atomic valued, but it has multiple books by the same author. This means that the AUTHOR_ID, AUTHOR_NAME and AUTHOR_BIO details for BOOK_ID B101 and B401 are the same."
-- "As the number of rows in the table increase, you will be needlessly storing more and more occurrences of these same pieces of information. And if an author updates their bio, you must update all of these occurrences."
--In this scenario, to enforce 2NF you can take the author information such as AUTHOR_ID, AUTHOR_NAME and AUTHOR_BIO out of the BookShop table into another table, for example a table named BookShop_AuthorDetails. You then link each book in the BookShop table to the relevant row in the BookShop_AuthorDetails table, using a unique common column such as AUTHOR_ID to link the tables. 

-- IBM instructions completed

-- In order to make second normalization form, we will create an extra table so each column (attribute) includes only atomic values
CREATE TABLE BookShop_AuthorDetails 
AS 
(SELECT DISTINCT AUTHOR_ID, AUTHOR_NAME, AUTHOR_BIO FROM BookShop) 
WITH DATA;
SELECT * FROM BookShop_AuthorDetails;

-- Now we remove the redundent data from the book_shop table
ALTER TABLE BookShop
DROP COLUMN AUTHOR_NAME
DROP COLUMN AUTHOR_BIO;
-- Now we are storing the author's information such as bio in one table only. Even if we need to update some data about the author, the updates will be only in one table.

-- Excercise 2 - Keys [Primary keys]
-- A: We identify records in their tables using their primary keys
-- B: We connect between tables using foreign keys 

--"By definition, a primary key is a column or group of columns that uniquely identify every row in a table. A table cannot have more than one primary key. The rules for defining a primary key are:

--1 - No two rows can have a duplicate primary key value.
--2 - Every row must have a primary key value.
--3 - No primary key field can be null."

--We will create a primary key for the BookShop and BookShop_AuthorDetails tables to uniquely identify every row in each of the tables. 
--We will set the BOOK_ID column of the BookShop table and AUTHOR_ID column of the BookShop_AuthorDetails table as a primary key for each of the tables. 
--Both of the columns were declared as NOT NULL when the tables were created (Check the the sql script or table definition of the tables to verify the NOT NULL constraint.
--Because the BookShop_AuthorDetails table was created from the BookShop table, it inherits all the data types and column constraints like NOT NULL from the BookShop parent table).

-- The ALTER TABLE statement we ran in the previous task puts the table into what's called a 'reorg pending' state. This occurs after any ALTER TABLE statement that contains a REORG-recommended operation is run. Therefore to put the table back into an 'organized' state, you need to call a sysproc admin command that reorganizes the table before you can continue.

Call Sysproc.admin_cmd ('reorg Table BookShop');

-- Now we can use the BOOK_ID column to uniquely identify every row in the BookShop table and the AUTHOR_ID column to uniquely identify every row in the BookShop_AuthorDetails table.
ALTER TABLE BookShop
ADD PRIMARY KEY (BOOK_ID);

ALTER TABLE BookShop_AuthorDetails
ADD PRIMARY KEY (AUTHOR_ID);

-- Excercise 2 - Keys [Foreign Keys]

-- By definition, a foreign key is a column that establishes a relationship between two tables. It acts as a cross-reference between two tables because it points to the primary key of another table. A table can have multiple foreign keys referencing primary keys of other tables. Rules for defining a foreign key:

-- A foreign key in the referencing table must match the structure and data type of the existing primary key in the referenced table.
-- A foreign key can only have values present in the referenced primary key
-- Foreign keys do not need to be unique. Most often they aren't.
-- Foreign keys can be null.

-- You will create a foreign key for the BookShop table by setting its AUTHOR_ID column as a foreign key, to establish a relationship between the BookShop and BookShop_AuthorDetails tables.

ALTER TABLE BookShop
ADD CONSTRAINT fk_BookShop FOREIGN KEY (AUTHOR_ID)
    REFERENCES BookShop_AuthorDetails(AUTHOR_ID)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

-- Note: ON UPDATE NO ACTION means if any existing row is updated in the foreign key column of the referencing table (the table containing the foreign key), the update will only be allowed if the new value of the foreign key column exists in the referenced primary key column of the referenced table (the table containing the primary key). However, any update on a row of the referenced primary key column of the referenced table is always rejected if there is the existence of a corresponding row in the referencing foreign key column of the referencing table.
-- ON DELETE NO ACTION means if any row in the referenced table (the table containing the primary key) is deleted, that row in the referenced table and the corresponding row in the referencing table (the table containing the foreign key) are not deleted.

-- Exercise 3: Constraints
-- In this exercise, you will review different kinds of relational model constraints that help to maintain data integrity in a relational data model.

-- Entity Integrity Constraint: Entity integrity ensures that no duplicate records exist within a table and that the column identifing each record within the table is not a duplicate and not null. The existence of a primary key in both the BookShop and BookShop_AuthorDetails tables satisfies this integrity constraint because a primary key mandates NOT NULL constraint as well as ensuring that every row in the table has a value that uniquely denotes the row.

-- Referential Integrity Constraint: Referential integrity ensures the existence of a referenced value if a value of one column of a table references a value of another column. The existence of the foreign Key (AUTHOR_ID) in the BookShop table satisfies this integrity constraint because a cross-reference relationship between the BookShop and BookShop_AuthorDetails tables exists. As a result of this relationship, each book in the BookShop table will be linked to the relevant row in the BookShop_AuthorDetails table through the AUTHOR_ID columns.

-- Domain Integrity Constraint: Domain integrity ensures that the purpose of a column is clear and the values of a column are consistent as well as valid. The existence of data types, length, date format, check, and null constraints in the CREATE statement of the BookShop table makes sure this integrity constraint is satisfied.


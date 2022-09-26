-- MySQL phpMyAdmin fundamental steps
-- Database Used in this Lab
-- Books database has been used in this lab.

-- The following diagram shows the structure of the myauthors table from the Books database:
-- In the table, authorid is an integer, firstname is a string that stores a maximum of 100 characters, middlename is a string that stores a maximum of 50 characters, and lastname is a string that stores a maximum of 100 characters.


-- Objectives
-- After completing this lab, you will be able to use phpMyAdmin with MySQL to:

-- Create a database.
-- Create tables.
-- Load data into tables manually using the phpMyAdmin GUI.
-- Load data into tables using a text/script file.


-- Exercise
-- In this exercise through different tasks, you will learn how to create tables and load data in the MySQL database service using the phpMyAdmin graphical user interface (GUI) tool.
-- Start MySQL service session in the Cloud IDE using the command below in the terminal. Find your MySQL service session password from the highlighted location of the terminal shown in the image below. 

start_mysql

-- Copy your phpMyAdmin weblink from the highlighted location of the terminal shown in the image below. Past it into the address bar in a new tab of your web browser. This will open the phpMyAdmin tool.

-- In the tree-view, click New to create a new empty database. Then enter Books as the name of the database and click Create.

-- The encoding will be left as utf8mb4_0900_ai_ci. UTF-8 is the most commonly used character encoding for content or data.


-- Task B: Create tables
-- In the Create table interface for the empty database Books, enter myauthors as the table name and 4 for the Number of columns. This is the first step to creating the table myauthors that was shown earlier in this lab.

-- Then click Go.

-- Enter the table definition for the myauthors table as shown in the image below with highlighted boxes. Then click Save.

-- The Table structure for the myauthors table will appear. Proceed to Task C.

INSERT INTO `myauthors` (`author_id`, `first_name`, `middle_name`, `last_name`) VALUES ('1', 'Merritt', '', 'Eric'), ('2', 'Linda', '', 'Mui');

-- Task D: Load data into tables using a text/script file.
-- Now you will use a SQL script to import the remainder of the myauthors table data. A SQL script file contains commands and statements that perform operations on your database, and can be useful when importing a large amount of data.

-- Download the SQL script below to your local computer: [completed] 

INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (3,'Alecos', "",'Papadatos');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (4,'Paul','C.van','Oorschot');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (5,'David', "",'Cronin');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (6,'Richard', "",'Blum');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (7,'Yuval','Noah','Harari');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (8,'Paul', "",'Albitz');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (9,'David', "",'Beazley');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (10,'John','Paul','Shen');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (11,'Andrew', "",'Miller');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (12,'Melanie', "",'Swan');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (13,'Neal', "",'Ford');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (14,'Nir', "",'Shavit');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (15,'Tim', "",'Kindberg');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (16,'Mike', "",'McQuaid');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (17,'Brian','P.','Hogan');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (18,'Jean-Philippe', "",'Aumasson');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (19,'Lance', "",'Fortnow');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (20,'Richard','C.','Jeffrey');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (21,'William','L.','Simon');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (22,'Magnus','Lie','Hetland');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (23,'Mike', "",'McShaffry');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (24,'Norman', "",'Matloff');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (25,'John','E.','Hopcroft');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (26,'S.', "",'Sudarshan');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (27,'Bruce', "",'Eckel');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (28,'Bill', "",'Gates');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (29,'Shane', "",'Harvie');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (30,'Ralph','P.','Grimaldi');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (31,'Garry', "",'Kasparov');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (32,'Lawrence','C.','Paulson');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (33,'Donella','H.','Meadows');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (34,'Maria', "",'Levitin');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (35,'Joy','A.','Thomas');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (36,'Scott', "",'Rosenberg');
INSERT INTO myauthors (author_id, first_name, middle_name, last_name) VALUES (37,'Mark', "",'Nelson');
-- ... and so forth


-- Go to Import tab for the myauthors table. Click Choose File and load the mysqltable-myauthorsinsert-data.sql file from your local computer storage. The rest of the settings can be left as they are because you are importing a SQL script that is encoded with UTF-8.

-- Then click Go. Notification of import success will appear.


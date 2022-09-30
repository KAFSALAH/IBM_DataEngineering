-- In this lab, you will use a PostgreSQL Database. PostgreSQL is a Relational Database Management System (RDBMS) designed to efficiently store, manipulate, and retrieve the data.

-- Objectives
-- After completing this lab, you will be able to use the PostgreSQL command line to:

-- Create a database.
-- Restore the structure and data of a table.
-- Explore and query tables.
-- Dump/backup tables from a database.

-- Lab Structure
-- In this exercise, you will go through several subtasks where you will use the PostgreSQL command line interface (CLI) to a create database and to restore the structure and contents of tables. Then you will learn how to explore and query tables. Finally, you will learn how to dump/backup tables from a database.

-- Now open up the PostgreSQL Command Line Interface (CLI) by clicking on the PostgreSQL CLI button.

-- Create a new database  using the command below in the terminal and proceed to Task B:

create database name_of_db;

-- Note: You are using create database command to create a new database within the PostgreSQL CLI. To create a new database named name_of_db outside the command line interface, you can use the following command command directly in a terminal window: createdb --username=postgres --host=localhost --password name_of_db after quitting the psql command prompt session with command \q


-- To connect to the newly created empty 'name_of_db' database, use the command below in the terminal and enter your PostgreSQL service session password:

\connect 'name_of_db';

-- Restore the 'name_of_db' PostgreSQL dump file (containing the 'name_of_db' database table definitions and data) to the newly created empty database using the command below in the terminal:

\include name_of_db_pgsql_dump.sql;

-- Repeat Step 1 to reconnect to the 'name_of_db' database after restoring the dump file. Proceed to Task C.


\connect name_of_db;

-- To list all the tables names from the 'name_of_db' database, use the command below in the terminal:

\dt

-- Explore the structure of the store table using the command below in the terminal:

\d store;

-- Retrieve all the records from the store table using the command below in the terminal:

select * from store;

-- Quit the PostgreSQL command prompt session using the command below in the terminal 

\q

-- Finally, to dump/backup the store table from the database, use the command below in the terminal and enter your PostgreSQL service
pg_dump --username=postgres --host=localhost --password --dbname='name_of_db' --table=store --format=plain > name_of_db_store_pgsql_dump.sql

-- To view the dump file within the terminal, use the command below in the terminal:

cat name_of_db_store_pgsql_dump.sql
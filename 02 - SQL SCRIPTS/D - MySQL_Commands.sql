-- In this lab, you will use the MySQL command line interface (CLI) to create a database and to restore the structure and contents of tables.
-- Then you will learn how to explore and query tables.
-- Finally, you will learn how to dump/backup tables from database.


--In this lab, you will use MySQL. MySQL is a Relational Database Management System (RDBMS) designed to efficiently store, manipulate, and retrieve data.

-- Objectives
-- After completing this lab, you will be able to use the MySQL command line to:

-- Create a database.
-- Restore the structure and data of a table.
-- Explore and query tables.
-- Dump/backup tables from a database.
"
Commands are below
"


start_mysql

-- initiate the mysql command prompt session within MySQL service session using the command below in the terminal:
mysql --host=127.0.0.1 --port=3306 --user=root --password [add password here]

create database name_of_data_base;

-- To use the newly created empty database, use the command below in the terminal:
use name_of_data_base;

-- Restore the database mysql dump file (containing the database table definitions and data) to the newly created empty database. A dump file is a text file that contains the data from a database in the form of SQL statements. This file can be imported using the command line with the following command:

source name_of_data_base_mysql_dump.sql; --This had been aleady downloaded previously

-- To list all the tables names from the  database, use the command below in the terminal:

SHOW FULL TABLES WHERE table_type = 'BASE TABLE';

-- The Table_type for these tables is BASE TABLE. BASE TABLE means that it is a table as opposed to a view (VIEW) or an INFORMATION_SCHEMA view (SYSTEM VIEW).

-- Explore the structure of a table in the database using the command below in the terminal
describe table_name;


-- To understand the output, see the following table:

-- Column Name	Definition
-- Field	Name of the column.
-- Type	Data type of the column.
-- Null	Displays YES if column can contain NULL values and NO if not. Notice how the primary key displays NO.
-- Key	Displays the value PRI if the column is a primary key, UNI if the column is a unique key, and MUL if the column is a non-unique index in which one value can appear multiple times. If there is no value displayed, then the column isn't indexed or it's indexed as a secondary column. Please note, that if more than one of these values applies to the column, the value that appears will be displayed based on the following order: PRI, UNI, and MUL.
-- Default	The default value of the column. If the column's value has specifically been set as NULL, then the value that appears will be NULL.
-- Extra	Any additional information about a column.

-- Quit the MySQL command prompt session using the command below in the terminal
\q


-- Finally, dump/backup the added table from the database using the command below in the terminal:

mysqldump --host=127.0.0.1 --port=3306 --user=root --password[add password] name_of_data_base name_of_table > name_of_table_mysql_dump.sql

-- To view the contents of the dump file within the terminal, use the command below:
cat name_of_table_mysql_dump.sql
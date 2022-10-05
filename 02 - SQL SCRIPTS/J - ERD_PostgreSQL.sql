-- Hands-on Lab : Database Design using ERDs
-- Estimated time needed: 45 minutes

-- In this lab, you will learn how to design a database by creating an entity relationship diagram (ERD) in the PostgreSQL database service using the pgAdmin graphical user interface (GUI) tool. First, you will create an ERD of a database. Next, you will generate and execute an SQL script to create the database schema from its ERD. Finally, you will load the created database schema with data.

Database Used in this Lab
-- The HR database used in this lab comes from the following source: HR Sample Database [Copyright 2021 - Oracle Corporation].

-- Objectives
-- After completing this lab, you will be able to use pgAdmin with PostgreSQL to:

-- Create an ERD of a database.
-- Generate and execute an SQL script from an ERD to create a schema.
-- Load the database schema with data.
-- This lab is divided into two exercises, Example Exercise and Practice Exercise.


-- Example Exercise
-- In this example exercise through different tasks, first you will create a partial ERD of the HR database. Next, you will generate and execute an SQL script to create the partial schema of the HR database from its ERD. Finally, you will load the created database schema with data by using restore feature.


-- Task A: Create an Entity Relationship Diagram (ERD) of a database
-- In this task of the Example Exercise, you will create a partial ERD of the HR database.

start_postgres

-- Copy your pgAdmin weblink from the highlighted location of the terminal shown in the image below and paste it to a new tab of your web browser.
-- You will see the pgAdmin GUI tool.
-- In the tree-view, expand Servers > postgres > Databases. Enter your PostgreSQL service session password if prompted during the process. Right-click on Databases and go to Create > Database. Type HR as name of the database and click Save.
-- In the tree-view, expand HR. Right-click on HR and select Generate ERD (Beta).
-- Click the Add table button. On the General tab, in the Name box, type employees as name of the table. Don't click OK, proceed to the next step.

-- Switch to the Columns tab and click the Add new row button to add the necessary column placeholders. Now enter the employees table definition information as shown in the image below to create its entity diagram. Then click OK.

-- [In this syntax, the precision is the total number of digits and the scale is the number of digits in the fraction part.]
-- Similarly, create entity diagrams for the other three tables following steps 7 and 8:

-- / Create an entity diagram for the jobs table
-- / Create an entity diagram for the departments table
-- / Create an entity diagram for the locations table
-- After creating all four entity diagrams, the entities of the ERD are complete.


-- Next you will create relationships between the entities by adding foreign keys to the tables. Select the entity diagram employees and click the One-to-Many link button. Now enter the definition information for a foreign key on the employees table as shown in the image below to create the relationship. Then click OK.
-- Similarly, create the other relationships between the tables following the instructions in step 11:

-- / Create a relationship between employees and jobs
-- / Create a relationship between departments and locations
-- / Create a relationship between departments and employees
-- After creating all four relationships, you have completed the ERD for this exercise. Proceed to Task B.

-- Task B: Generate and execute SQL script from ERD to create schema
-- In this task of the Example Exercise, you will generate and execute an SQL script from the ERD you created in Task A of the Example Exercise.

-- In the Generate ERD (Beta) window, click the Generate SQL button.


-- A new Query Editor window will open containing a SQL script generated from the ERD. Click the Execute/Refresh button to run the script. Proceed to Task C.

-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public.employees
(
    employee_id integer NOT NULL,
    first_name character varying(20),
    last_name character varying(25) NOT NULL,
    email character varying(100) NOT NULL,
    phone_number character varying(20),
    hire_date date NOT NULL,
    job_id character varying(10) NOT NULL,
    salary numeric(8, 2) NOT NULL,
    commission_pct numeric(2, 2),
    manager_id integer,
    department_id integer,
    PRIMARY KEY (employee_id)
);

CREATE TABLE public.jobs
(
    job_id character varying(10) NOT NULL,
    job_title character varying(35) NOT NULL,
    min_salary numeric(8, 2),
    max_salary numeric(8, 2),
    PRIMARY KEY (job_id)
);

CREATE TABLE public.departments
(
    department_id integer NOT NULL,
    department_name character varying(30) NOT NULL,
    manager_id integer,
    location_id integer,
    PRIMARY KEY (department_id)
);

CREATE TABLE public.locations
(
    location_id integer NOT NULL,
    street_address character varying(40),
    postal_code character varying(12),
    city character varying(30) NOT NULL,
    state_province character varying(25),
    country_id character(2) NOT NULL,
    PRIMARY KEY (location_id)
);

ALTER TABLE public.employees
    ADD FOREIGN KEY (department_id)
    REFERENCES public.departments (department_id)
    NOT VALID;


ALTER TABLE public.employees
    ADD FOREIGN KEY (job_id)
    REFERENCES public.jobs (job_id)
    NOT VALID;


ALTER TABLE public.departments
    ADD FOREIGN KEY (location_id)
    REFERENCES public.locations (location_id)
    NOT VALID;


ALTER TABLE public.departments
    ADD FOREIGN KEY (manager_id)
    REFERENCES public.employees (employee_id)
    NOT VALID;

END;

-- Task C: Load the database schema with data.
-- In this task of the Example Exercise, you will load the database schema you created in Task B of the Example Exercise with data using the pgAdmin restore feature.

-- Download the HRpgsqldumpdatafor_example-exercise.tar PostgreSQL dump file (containing the partial HR database data) using the link below to your local computer storage.

-- HRpgsqldumpdatafor_example-exercise.tar
-- Follow the instructions below to import/restore the data:

-- In the tree-view, expand HR. Right-click HR and click Restore.

-- On the General tab, click the Select file button by the Filename box.
-- Click the Upload File button.
-- Double-click on the drop files area and load the HRpgsqldumpdatafor_example-exercise.tar you downloaded earlier from your local computer storage.
-- When the upload is complete, close the drop files area by clicking the X button.
-- Make sure Format is set to All Files, select the uploaded HRpgsqldumpdatafor_example-exercise.tar file from the list, and then click the Select button.
-- Now switch to Restore options tab.
-- Under Disable, set the Trigger option to Yes. Then click Restore button.

-- Practice Exercise
-- In this practice exercise, first you will finish creating a partially complete ERD for the HR database. Next, you will generate and execute an SQL script to build the complete schema of the HR database from its ERD. Finally, you will load the complete database schema with data by using restore feature.

-- Download the HRpgsqlERDforpractice-exercise.pgerd ERD file (containing a partial HR database ERD based on the one that you created in Task A of Example Exercise) below to your local computer storage.

-- HRpgsqlERDforpractice-exercise.pgerd
-- In pgAdmin, create a new database named HR_Complete.

-- Open the ERD Tool and use the Load from file button to load the HRpgsqlERDforpractice-exercise.pgerd file.


-- You will see the previous four entity diagrams along with relationships that you created in the Example Exercise. You will also see three new entity diagrams for the jobhistory, regions, and countries tables as well as one new relationship within the entity diagram of the employees table between managerid as local column and employee_id as referenced column.

-- Create the remaining relationships between the tables:
--  Create a relationship between countries and regions
-- Select the entity diagram countries and click the One-to-Many link button. Now enter the definition information for a foreign key on the countries table as shown in the image below to create the relationship. Then click OK.


--  Create a relationship between job_history and departments
-- Select the entity diagram jobhistory and click the One-to-Many link button. Now enter the definition information for a foreign key on the jobhistory table as shown in the image below to create the relationship. Then click OK.



--  Create a relationship between job_history and employees
-- Select the entity diagram jobhistory and click the One-to-Many link button. Now enter the definition information for a foreign key on the jobhistory table as shown in the image below to create the relationship. Then click OK.

--  Create a relationship between job_history and jobs
-- Select the entity diagram jobhistory and click the One-to-Many link button. Now enter the definition information for a foreign key on the jobhistory table as shown in the image below to create the relationship. Then click OK.
--  Create a relationship between locations and countries
-- Select the entity diagram locations and click the One-to-Many link button. Now enter the definition information for a foreign key on the locations table as shown in the image below to create the relationship. Then click OK.

-- After creating the remaining relationships, the complete ERD of the HR database will look like the following image:


-- Generate and execute an SQL script from the ERD to create the schema of the HR_Complete database.

-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public.countries
(
    country_id character(2) NOT NULL,
    country_name character varying(40),
    region_id integer NOT NULL,
    PRIMARY KEY (country_id)
);

CREATE TABLE public.departments
(
    department_id integer NOT NULL,
    department_name character varying(30) NOT NULL,
    manager_id integer,
    location_id integer,
    PRIMARY KEY (department_id)
);

CREATE TABLE public.employees
(
    employee_id integer NOT NULL,
    first_name character varying(20),
    last_name character varying(25) NOT NULL,
    email character varying(100) NOT NULL,
    phone_number character varying(20),
    hire_date date NOT NULL,
    job_id character varying(10) NOT NULL,
    salary numeric(8, 2) NOT NULL,
    commission_pct numeric(2, 2),
    manager_id integer,
    department_id integer,
    PRIMARY KEY (employee_id)
);

CREATE TABLE public.job_history
(
    employee_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    job_id character varying(10) NOT NULL,
    department_id integer NOT NULL,
    PRIMARY KEY (employee_id, start_date)
);

CREATE TABLE public.jobs
(
    job_id character varying(10) NOT NULL,
    job_title character varying(35) NOT NULL,
    min_salary numeric(8, 2),
    max_salary numeric(8, 2),
    PRIMARY KEY (job_id)
);

CREATE TABLE public.locations
(
    location_id integer NOT NULL,
    street_address character varying(40),
    postal_code character varying(12),
    city character varying(30) NOT NULL,
    state_province character varying(25),
    country_id character(2) NOT NULL,
    PRIMARY KEY (location_id)
);

CREATE TABLE public.regions
(
    region_id integer NOT NULL,
    region_name character varying(25),
    PRIMARY KEY (region_id)
);

ALTER TABLE public.departments
    ADD FOREIGN KEY (location_id)
    REFERENCES public.locations (location_id)
    NOT VALID;


ALTER TABLE public.departments
    ADD FOREIGN KEY (manager_id)
    REFERENCES public.employees (employee_id)
    NOT VALID;


ALTER TABLE public.employees
    ADD FOREIGN KEY (department_id)
    REFERENCES public.departments (department_id)
    NOT VALID;


ALTER TABLE public.employees
    ADD FOREIGN KEY (job_id)
    REFERENCES public.jobs (job_id)
    NOT VALID;


ALTER TABLE public.employees
    ADD FOREIGN KEY (manager_id)
    REFERENCES public.employees (employee_id)
    NOT VALID;


ALTER TABLE public.countries
    ADD FOREIGN KEY (region_id)
    REFERENCES public.regions (region_id)
    NOT VALID;


ALTER TABLE public.job_history
    ADD FOREIGN KEY (department_id)
    REFERENCES public.departments (department_id)
    NOT VALID;


ALTER TABLE public.job_history
    ADD FOREIGN KEY (employee_id)
    REFERENCES public.employees (employee_id)
    NOT VALID;


ALTER TABLE public.job_history
    ADD FOREIGN KEY (job_id)
    REFERENCES public.jobs (job_id)
    NOT VALID;


ALTER TABLE public.locations
    ADD FOREIGN KEY (country_id)
    REFERENCES public.countries (country_id)
    NOT VALID;

END;

-- Download the HRpgsqldumpdata.tar PostgreSQL dump file (containing the complete HR database data) below to your local computer storage. Use the dump file to restore/import the data to the HRComplete database.

-- HRpgsqldump_data.tar

-- [END!]
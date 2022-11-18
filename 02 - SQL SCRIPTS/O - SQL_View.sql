-- How does the syntax of a CREATE VIEW statement look?

CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

-- How does the syntax of a REPLACE VIEW statement look?

CREATE OR REPLACE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

-- How does the syntax of a DROP VIEW statement look?

DROP VIEW view_name;

-- Practice with view

CREATE VIEW EMPSALARY AS 
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, SALARY
FROM EMPLOYEES; 

CREATE OR REPLACE VIEW EMPSALARY  AS 
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, JOB_TITLE, MIN_SALARY, MAX_SALARY
FROM EMPLOYEES, JOBS
WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;



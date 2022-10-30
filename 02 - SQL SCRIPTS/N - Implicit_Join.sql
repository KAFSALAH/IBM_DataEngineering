-- Exercise 1: Accessing Multiple Tables with Sub-Queries

-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.

select * from EMPLOYEES where JOB_ID IN (select JOB_IDENT from JOBS);

-- Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.

SELECT * FROM EMPLOYEES AS E WHERE E.JOB_ID IN (SELECT JOB_IDENT FROM JOBS WHERE JOB_TITLE = 'Jr. Desginer')

-- Retrieve JOB information and who earn more than $70,000.

SELECT * FROM EMPLOYEES, JOBS  WHERE SALARY > 70000 AND JOB_ID = JOB_IDENT

-- OR 
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from JOBS where JOB_IDENT IN (select JOB_ID from EMPLOYEES where SALARY > 70000 );

-- Retrieve JOB information and list of employees whose birth year is after 1976.

SELECT * FROM JOBS AS J, EMPLOYEES AS E WHERE (YEAR(E.B_DATE) > 1976 AND J.JOB_IDENT = E.JOB_ID)
-- OR 
SELECT * FROM JOBS
WHERE JOB_IDENT IN (SELECT EMPLOYEES.JOB_ID FROM EMPLOYEES WHERE YEAR(EMPLOYEES.B_DATE) > 1976)

-- Retrieve JOB information and list of female employees whose birth year is after 1976.

SELECT * FROM JOBS WHERE JOB_IDENT IN (SELECT EMPLOYEES.JOB_ID FROM EMPLOYEES WHERE EMPLOYEES.SEX = 'F' AND YEAR(EMPLOYEES.B_DATE) > 1976)

-- Exercise 2: Accessing Multiple Tables with Implicit Joins

-- Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
SELECT * FROM EMPLOYEES, JOBS

-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.

SELECT * FROM EMPLOYEES, JOBS WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT

-- Redo the previous query, using shorter aliases for table names.

SELECT * FROM EMPLOYEES AS E, JOBS AS J WHERE E.JOB_ID = J.JOB_IDENT

-- Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.

SELECT EMP_ID, , F_NAME, L_NAME, JOB_TITLE FROM EMPLOYEES E, JOBS J 
WHERE (E.JOB_ID = J.JOB_IDENT)

-- Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause.

SELECT E.EMP_ID, , E.F_NAME, E.L_NAME, J.JOB_TITLE FROM EMPLOYEES E, JOBS J 
WHERE (E.JOB_ID = J.JOB_IDENT)

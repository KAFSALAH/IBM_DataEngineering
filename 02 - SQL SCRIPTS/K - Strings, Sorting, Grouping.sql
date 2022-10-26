-- Retrieve all employees whose address is in Elgin,IL.

SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE ADDRESS LIKE '%Elgin,IL%';

-- Retrieve all employees who were born during the 1970's.

SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE B_DATE LIKE '197%';

-- Retrieve all employees in department 5 whose salary is between 60000 and 70000.

SELECT *
FROM EMPLOYEES
WHERE (SALARY BETWEEN 60000 AND 70000) AND DEP_ID = 5;

-- Retrieve a list of employees ordered by department ID.

SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID;

-- Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name.

SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID DESC, L_NAME DESC;

-- In SQL problem 2 (Exercise 2 Problem 2), use department name instead of department ID. Retrieve a list of employees ordered by department name, and within each department ordered alphabetically in descending order by last name.

SELECT D.DEP_NAME , E.F_NAME, E.L_NAME
FROM EMPLOYEES as E, DEPARTMENTS as D
WHERE E.DEP_ID = D.DEPT_ID_DEP
ORDER BY D.DEP_NAME, E.L_NAME DESC;

-- In the SQL Query above, D and E are aliases for the table names. Once you define an alias like D in your query, you can simply write D.COLUMN_NAME rather than the full form DEPARTMENTS.COLUMN_NAME.

-- Exercise 3: Grouping
-- In this exercise, you will go through some SQL problems on Grouping.

-- NOTE: The SQL problems in this exercise involve usage of SQL Aggregate functions AVG and COUNT. COUNT has been covered earlier. AVG is a function that can be used to calculate the Average or Mean of all values of a specified column in the result set. For example, to retrieve the average salary for all employees in the EMPLOYEES table, issue the query: SELECT AVG(SALARY) FROM EMPLOYEES;. You will learn more about AVG and other aggregate functions later in the lecture Built-in Database Functions.

-- For each department ID retrieve the number of employees in the department.

SELECT COUNT(E.EMP_ID), E.DEP_ID FROM EMPLOYEES AS E GROUP BY E.DEP_ID;

-- OR 

SELECT COUNT(E.EMP_ID) AS NUMBER_OF_EMPLOYEES, E.DEP_ID, D.DEP_NAME FROM EMPLOYEES AS E, DEPARTMENTS AS D
 WHERE E.DEP_ID = D.DEPT_ID_DEP
  GROUP BY E.DEP_IDL

  -- IBM SOLUTION 
SELECT DEP_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEP_ID;


-- For each department retrieve the number of employees in the department, and the average employee salary in the department..

SELECT COUNT(E.EMP_ID) AS NUMBER_OF_EMPLOYEES, AVG(E.SALARY) AS AVG_SALARY, E.DEP_ID, D.DEP_NAME FROM DEPARTMENTS AS D, EMPLOYEES AS E
WHERE E.DEP_ID = D.DEPT_ID_DEP
GROUP BY D.DEPT_ID_DEP;
-- SO COUNT AND AVG ARE GROUPED BY DEPT_ID_DEP


-- In SQL problem 3 (Exercise 3 Problem 3), order the result set by Average Salary..
SELECT COUNT(E.EMP_ID) AS NUMBER_OF_EMPLOYEES, AVG(E.SALARY) AS AVG_SALARY, E.DEP_ID, D.DEP_NAME FROM DEPARTMENTS AS D, EMPLOYEES AS E
WHERE E.DEP_ID = D.DEPT_ID_DEP
GROUP BY D.DEPT_ID_DEP 
ORDER BY AVG_SALARY DESC;


-- In SQL problem 4 (Exercise 3 Problem 4), limit the result to departments with fewer than 4 employees.

SELECT COUNT(E.EMP_ID) AS NUMBER_OF_EMPLOYEES, AVG(E.SALARY) AS AVG_SALARY, E.DEP_ID, D.DEP_NAME FROM DEPARTMENTS AS D, EMPLOYEES AS E
WHERE(E.DEP_ID = D.DEPT_ID_DEP) 
GROUP BY D.DEPT_ID_DEP 
HAVING NUMBER_OF_EMPLOYEES < 4
ORDER BY AVG_SALARY DESC;

-- Execute a failing query (i.e. one which gives an error) to retrieve all employees records whose salary is lower than the average salary.
select * 
from employees 
where salary < AVG(salary);

-- Execute a working query using a sub-select to retrieve all employees records whose salary is lower than the average salary.
SELECT * FROM EMPLOYEES 
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES)

-- Execute a failing query (i.e. one which gives an error) to retrieve all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
SELECT EMP_ID, SALARY, MAX(SALARY) FROM EMPLOYEES

-- Execute a Column Expression that retrieves all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
SELECT EMP_ID, SALARY, (SELECT MAX(SALARY) FROM EMPLOYEES) AS MAX_SALARY FROM EMPLOYEES

-- Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).
SELECT * FROM (SELECT EMP_ID, F_NAME, L_NAME, JOB_ID, MANAGER_ID, DEP_ID FROM EMPLOYEES) AS NEW_TABLE
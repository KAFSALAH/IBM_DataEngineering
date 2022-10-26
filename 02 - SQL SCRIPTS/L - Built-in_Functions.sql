
--SCHEMA definition (that is list of columns, their data types, and so on)

drop table if exists PETRESCUE;

create table PETRESCUE (
	ID INTEGER NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	COST DECIMAL(6,2),
	RESCUEDATE DATE,
	PRIMARY KEY (ID)
	);

insert into PETRESCUE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15')
	
;


-- Exercise 2: Aggregate Functions
-- Query A1: Enter a function that calculates the total cost of all animal rescues in the PETRESCUE table.
select sum(cost) as Total_cost from petrescue 

-- Query A2: Enter a function that displays the total cost of all animal rescues in the PETRESCUE table in a column called SUM_OF_COST.
select sum(cost) as SUM_OF_COST from petrescue 

-- Query A3: Enter a function that displays the maximum quantity of animals rescued.
select max(quantity) from petrescue;
select animal from petrescue 
where quantity = (select max(quantity) from petrescue);

-- Query A4: Enter a function that displays the average cost of animals rescued.
select avg(cost) from petrescue;

-- Query A5: Enter a function that displays the average cost of rescuing a dog.
select SUM(COST)/SUM(QUANTITY) from petrescue
WHERE ANIMAL = 'Dog';

-- Exercise 3: Scalar and String Functions
-- Query B1: Enter a function that displays the rounded cost of each rescue.
SELECT ROUND(COST) FROM PETRESCUE;

-- Query B2: Enter a function that displays the length of each animal name.
SELECT LENGTH(ANIMAL) FROM PETRESCUE;

-- Query B3: Enter a function that displays the animal name in each rescue in uppercase.
SELECT UPPER(ANIMAL) FROM PETRESCUE; -- IBM-DB2
select UCASE(ANIMAL) from PETRESCUE; -- MySQL

-- Query B4: Enter a function that displays the animal name in each rescue in uppercase without duplications.
SELECT distinct(UPPER(ANIMAL)) FROM PETRESCUE;

-- Query B5: Enter a query that displays all the columns from the PETRESCUE table, where the animal(s) rescued are cats. Use cat in lower case in the query.
select * from petrescue
where lower(animal) = 'cat'; -- IBM-DB2
select * from PETRESCUE where LCASE(ANIMAL) = 'cat'; -- MySQL

-- Exercise 4: Date and Time Functions
-- Query C1: Enter a function that displays the day of the month when cats have been rescued.
SELECT DAY(rescuedate) AS DAY_OF_RESCUE from petrescue;

SELECT DAY(rescuedate) AS DAY_OF_RESCUE_FOR_CATS from petrescue
WHERE UPPER(ANIMAL) = 'CAT';


-- Query C2: Enter a function that displays the number of rescues on the 5th month.
select SUM(QUANTITY) from PETRESCUE where MONTH(RESCUEDATE)='05';

-- Query C3: Enter a function that displays the number of rescues on the 14th day of the month.
select SUM(QUANTITY) from PETRESCUE
where DAY(RESCUEDATE)='14';

-- Query C4: Animals rescued should see the vet within three days of arrivals. Enter a function that displays the third day from each rescue.
SELECT *, (RESCUEDATE+3) AS VET_DATE FROM PETRESCUE; --IBM-DB2
select DATE_add(RESCUEDATE, INTERVAL 3 DAY) from PETRESCUE; --MySQL

-- Query C5: Enter a function that displays the length of time the animals have been rescued; the difference between today’s date and the rescue date
SELECT (CURRENT_DATE - RESCUEDATE) FROM PETRESCUE; -- IBM-DB2
select DATEDIFF(CURRENT_TIMESTAMP,RESCUEDATE) from PETRESCUE; --MySQL
-- Drop the table in case IT existS

 DROP TABLE PETSHOP;

-- Create the table

CREATE TABLE PETSHOP (
	ID INT NOT NULL, 
	ANIMAL VARCHAR(20), 
	SALEPRICE DECIMAL(6,2) , 
	SALEDATE DATE, 
	QUANTITY INT
	);

-- Insert sample data into the table

INSERT INTO PETSHOP VALUES
(1, 'Cat', 450.09, '2022-05-29',9),
(2, 'Dog', 666.66, '2022-06-01',3),
(3, 'Parrot', 50, '2022-06-04',2),
(4, 'Hamester', 60.6, '2022-06-09',1),
(5, 'Goldfish', 48.48, '2022-06-09',4);

-- Retrieve all records from the table

SELECT * FROM PETSHOP;

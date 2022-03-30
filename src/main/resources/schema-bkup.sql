DROP TABLE IF EXISTS TBL_EMPLOYEES;
  
CREATE TABLE TBL_EMPLOYEES (
  id INT AUTO_INCREMENT  PRIMARY KEY,
  first_name VARCHAR(250) NOT NULL,
  last_name VARCHAR(250) NOT NULL,
  email VARCHAR(250) DEFAULT NULL
);

DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS DEPARTMENT;
DROP TABLE IF EXISTS EMPLOYEE2;
DROP TABLE IF EXISTS DEPARTMENT2;

CREATE TABLE DEPARTMENT (
  ID IDENTITY PRIMARY KEY,
  NAME VARCHAR(64) NOT NULL
);

CREATE TABLE EMPLOYEE (
  ID IDENTITY PRIMARY KEY,
  NAME VARCHAR(64) NOT NULL,
  DEPT_ID LONG,
  CONSTRAINT FK_EMP_DEPT_ID FOREIGN KEY(DEPT_ID) REFERENCES DEPARTMENT(ID)
);

CREATE TABLE DEPARTMENT2 (
  ID IDENTITY PRIMARY KEY,
  NAME VARCHAR(64) NOT NULL
);

CREATE TABLE EMPLOYEE2 (
  ID IDENTITY PRIMARY KEY,
  NAME VARCHAR(64) NOT NULL,
  DEPT_ID LONG,
  CONSTRAINT FK_EMP_DEPT2_ID FOREIGN KEY(DEPT_ID) REFERENCES DEPARTMENT2(ID)
);

-- https://www.sqltutorial.org/sql-sample-database/


-- ************** 1-1 Mapping - Starts***************

DROP TABLE IF EXISTS Country;
DROP TABLE IF EXISTS UNrepresentative;

CREATE TABLE Country
(
Pk_Country_Id INT IDENTITY PRIMARY KEY,
Name VARCHAR(100),
Officiallang VARCHAR(100),
Size INT(11)
);

CREATE TABLE UNrepresentative
(
Pk_UNrepresentative_Id INT PRIMARY KEY,
Name VARCHAR(100),
Gender VARCHAR(100),
Fk_Country_Id INT NOT NULL,
FOREIGN KEY (Fk_Country_Id)
      REFERENCES Country(Pk_Country_Id)
      ON DELETE CASCADE
);

INSERT INTO Country (Pk_Country_Id,Name,Officiallang,Size)
VALUES (1,'Nigeria','English',923);
INSERT INTO Country (Pk_Country_Id,Name,Officiallang,Size)
VALUES (2,'Ghana','English',238);
INSERT INTO Country (Pk_Country_Id,Name,Officiallang,Size)
VALUES (3,'South Africa','English',1219);
INSERT INTO UNrepresentative (Pk_Unrepresentative_Id,Name,Gender,Fk_Country_Id)
VALUES (51,'Abubakar Ahmad','Male',1);
INSERT INTO UNrepresentative (Pk_Unrepresentative_Id,Name,Gender,Fk_Country_Id)
VALUES (52,'Joseph Nkrumah','Male',2);
--INSERT INTO UNrepresentative (Pk_Unrepresentative_Id,Name,Gender,Fk_Country_Id)
--VALUES (53,'Lauren Zuma,'Female',3);

-- ************** 1-1 Mapping - Ends***************

-- ************** 1 to Many Mapping - Starts***************

DROP TABLE IF EXISTS Car;
DROP TABLE IF EXISTS Engineer;

CREATE TABLE Car
(
Pk_Car_Id INT PRIMARY KEY,
Brand VARCHAR(100),
Model VARCHAR(100)
);

CREATE TABLE Engineer
(
Pk_Engineer_Id INT PRIMARY KEY,
FullName VARCHAR(100),
MobileNo CHAR(11),
Fk_Car_Id integer NOT NULL,
FOREIGN KEY (Fk_Car_Id)
      REFERENCES Car(Pk_Car_Id)
      ON DELETE CASCADE
);

INSERT INTO Car (Pk_Car_Id,Brand,Model)
VALUES (1,'Benz','GLK350');
INSERT INTO Car (Pk_Car_Id,Brand,Model)
VALUES (2,'Toyota','Camry XLE');
INSERT INTO Engineer (Pk_Engineer_Id,FullName,MobileNo,Fk_Car_Id)
VALUES(50,'Elvis Young','08038888888',2);
INSERT INTO Engineer (Pk_Engineer_Id,FullName,MobileNo,Fk_Car_Id)
VALUES(51,'Bola Johnson','08020000000',1);
INSERT INTO Engineer (Pk_Engineer_Id,FullName,MobileNo,Fk_Car_Id)
VALUES(52,'Kalu Ikechi','09098888888',1);
INSERT INTO Engineer (Pk_Engineer_Id,FullName,MobileNo,Fk_Car_Id)
VALUES(53,'Smart Wonodu','08185555555',1);
INSERT INTO Engineer (Pk_Engineer_Id,FullName,MobileNo,Fk_Car_Id)
VALUES(54,'Umaru Suleja','08056676666',1);
-- ************** 1 to Many Mapping - Ends***************

-- https://www.sqltutorial.org/sql-sample-database/

CREATE TABLE regions (
	region_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	region_name VARCHAR (25) DEFAULT NULL
);

CREATE TABLE countries (
	country_id CHAR (2) PRIMARY KEY,
	country_name VARCHAR (40) DEFAULT NULL,
	region_id INT (11) NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE locations (
	location_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	street_address VARCHAR (40) DEFAULT NULL,
	postal_code VARCHAR (12) DEFAULT NULL,
	city VARCHAR (30) NOT NULL,
	state_province VARCHAR (25) DEFAULT NULL,
	country_id CHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE jobs (
	job_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	job_title VARCHAR (35) NOT NULL,
	min_salary DECIMAL (8, 2) DEFAULT NULL,
	max_salary DECIMAL (8, 2) DEFAULT NULL
);

CREATE TABLE departments (
	department_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL,
	location_id INT (11) DEFAULT NULL,
	FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE employees (
	employee_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT (11) NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT (11) DEFAULT NULL,
	department_id INT (11) DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);

CREATE TABLE dependents (
	dependent_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT (11) NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Data: https://www.sqltutorial.org/sql-sample-database/

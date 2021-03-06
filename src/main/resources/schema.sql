DROP TABLE IF EXISTS TBL_EMPLOYEES;
  
CREATE TABLE TBL_EMPLOYEES (
  id INT AUTO_INCREMENT  PRIMARY KEY,
  first_name VARCHAR(250) NOT NULL,
  last_name VARCHAR(250) NOT NULL,
  email VARCHAR(250) DEFAULT NULL
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
Pk_UNrepresentative_Id INT AUTO_INCREMENT PRIMARY KEY,
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
Pk_Car_Id INT AUTO_INCREMENT PRIMARY KEY,
Brand VARCHAR(100),
Model VARCHAR(100)
);

CREATE TABLE Engineer
(
Pk_Engineer_Id INT AUTO_INCREMENT PRIMARY KEY,
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

-- ************** Many to Many Mapping - Starts***************

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Student_Class;
DROP TABLE IF EXISTS StudentClassRelation;

CREATE TABLE Student(
StudentID INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(100)
);
CREATE TABLE Student_Class(
ClassID INT AUTO_INCREMENT PRIMARY KEY,
Course VARCHAR(100)
);
CREATE TABLE StudentClassRelation(
StudentID INT NOT NULL,
ClassID INT NOT NULL,
FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
FOREIGN KEY (ClassID) REFERENCES Student_Class(ClassID),
UNIQUE (StudentID, ClassID)
);
INSERT INTO Student (StudentID,Name)
VALUES (1,'Vinoth');
INSERT INTO Student (StudentID,Name)
VALUES (2,'Arun');

INSERT INTO Student_Class (ClassID,Course)
VALUES (1,'Biology');
INSERT INTO Student_Class (ClassID,Course)
VALUES (2,'Chemistry');
INSERT INTO Student_Class (ClassID,Course)
VALUES (3,'Physics');
INSERT INTO Student_Class (ClassID,Course)
VALUES (4,'English');
INSERT INTO Student_Class (ClassID,Course)
VALUES (5,'Computer Science');
INSERT INTO Student_Class (ClassID,Course)
VALUES (6,'History');
INSERT INTO StudentClassRelation (StudentID,ClassID)
VALUES (1,2);
INSERT INTO StudentClassRelation (StudentID,ClassID)
VALUES (1,4);
INSERT INTO StudentClassRelation (StudentID,ClassID)
VALUES (1,6);
INSERT INTO StudentClassRelation (StudentID,ClassID)
VALUES (2,3);
INSERT INTO StudentClassRelation (StudentID,ClassID)
VALUES (2,1);
INSERT INTO StudentClassRelation (StudentID,ClassID)
VALUES (2,6);

-- ************** Many to Many Mapping - Ends***************



CREATE TABLE EMPLOYEE
(
	-- Tablo özelliklerinin tanımlanması
	Fname		VARCHAR(15)		NOT NULL,
	Minit		CHAR,
	Lname		VARCHAR(15)		NOT NULL,
	Ssn			CHAR(9)			NOT NULL,
	Bdate		DATE,
	Adress		VARCHAR(30),
	Sex			CHAR,
	Salary		DECIMAL(10,2),
	Super_ssn	CHAR(9),
	Dno			INT				NOT NULL,
	PRIMARY KEY(Ssn),
	FOREIGN KEY(Super_ssn) REFERENCES EMPLOYEE(Ssn),
	--FOREIGN KEY(Dno) REFERENCES DEPARTMENT(Dnumber)
);

insert into DEPARTMENT
	values ( 'Research', 5, null, '22-MAY-78' );

insert into DEPARTMENT
	values ( 'Administration', 4, null, '01-JAN-85' );

insert into DEPARTMENT
	values ( 'Headquarters', 1, null, '19-JUN-71' );

insert into EMPLOYEE
	values ( 'James', 'E', 'Borg', 888665555, '10-NOV-27', '450 Stone, Houston, TX', 'M', 55000, null, 1 );

insert into EMPLOYEE
	values	( 'Franklin', 'T', 'Wong', 333445555, '18-DEC-45', '638 Voss, Houston, TX', 'M', 40000, 888665555, 5);

insert into EMPLOYEE
	values	( 'John', 'B', 'Smith', 123456789, '09-JAN-55', '731 Fondren, Houston, TX', 'M', 30000, 333445555, 5 );

insert into EMPLOYEE
	values	( 'Jennifer', 'S', 'Wallace', 987654321, '20-JUN-31', '291 Berry, Bellair, TX', 'F', 43000, 888665555, 4 );

insert into EMPLOYEE
	values	( 'Alicia', 'J', 'Zelaya', 999887777, '19-JUL-58', '3321 Castle, Spring, TX', 'F', 25000, 987654321, 4 );

insert into EMPLOYEE
	values	( 'Ramesh', 'K', 'Narayan', 666884444, '15-SEP-52', '975 Fire Oak, Humble, TX', 'M', 38000, 333445555, 5 );

insert into EMPLOYEE
	values	( 'Joyce', 'A', 'English', 453453453, '31-JUL-62', '5631 Rice, Houston, TX', 'F', 25000, 333445555, 5 );

insert into EMPLOYEE
	values	( 'Ahmad', 'V', 'Jabbar', 987987987, '29-MAR-59', '980 Dallas, Houston, TX', 'M', 25000, 987654321, 1 );


update DEPARTMENT
	set mgr_ssn = 333445555
	where dnumber = 5;

update DEPARTMENT
	set mgr_ssn = 987654321
	where dnumber = 4;

update DEPARTMENT
	set mgr_ssn = 888665555
	where dnumber = 1;

insert into DEPT_LOCATIONS
	values ( 1, 'Houston' );

insert into DEPT_LOCATIONS
	values ( 4, 'Stafford' );

insert into DEPT_LOCATIONS
	values ( 5, 'Bellaire' );

insert into DEPT_LOCATIONS
	values ( 5, 'Sugarland' );

insert into DEPT_LOCATIONS
	values ( 5, 'Houston' );

insert into PROJECT
	values ( 'ProductX', 1, 'Bellaire', 5 );

insert into PROJECT
	values ( 'ProductY', 2, 'Sugarland', 5 );

insert into PROJECT
	values ( 'ProductZ', 3, 'Houston', 5 );

insert into PROJECT
	values ( 'Computerization', 10, 'Stafford', 4 );

insert into PROJECT
	values ( 'Reorganization', 20, 'Houston', 1 );

insert into PROJECT
	values ( 'Newbenefits', 30, 'Stafford', 4 );

insert into WORKS_ON
	values ( 123456789, 1, 32.5 );

insert into WORKS_ON
	values ( 123456789, 2, 7.5 );

insert into WORKS_ON
	values ( 666884444, 3, 40.0 );

insert into WORKS_ON
	values ( 453453453, 1, 20.0 );

insert into WORKS_ON
	values ( 453453453, 2, 20.0 );

insert into WORKS_ON
	values ( 333445555, 2, 10.0 );

insert into WORKS_ON
	values ( 333445555, 3, 10.0 );

insert into WORKS_ON
	values ( 333445555, 10, 10.0 );

insert into WORKS_ON
	values ( 333445555, 20, 10.0 );

insert into WORKS_ON
	values ( 999887777, 30, 30.0 );

insert into WORKS_ON
	values ( 999887777, 10, 10.0 );

insert into WORKS_ON
	values ( 987987987, 10, 35.0 );

insert into WORKS_ON
	values ( 987987987, 30, 5.0 );

insert into WORKS_ON
	values ( 987654321, 30, 20.0 );

insert into WORKS_ON
	values ( 987654321, 20, 15.0 );

insert into WORKS_ON
	values ( 888665555, 20, null );


insert into DEPENDENT
	values ( 333445555, 'Alice', 'F', '05-APR-76', 'DAUGHTER' );

insert into DEPENDENT
	values ( 333445555, 'Theodore', 'M', '25-OCT-73', 'SON' );

insert into DEPENDENT
	values ( 333445555, 'Joy', 'F', '03-MAR-48', 'SPOUSE' );

insert into DEPENDENT
	values ( 987654321, 'Abner', 'M', '29-FEB-32', 'SPOUSE' );

insert into DEPENDENT
	values ( 123456789, 'Michael', 'M', '01-JAN-78', 'SON' );

insert into DEPENDENT
	values ( 123456789, 'Alice', 'F', '31-DEC-78', 'DAUGHTER' );

insert into DEPENDENT
	values ( 123456789, 'Elizabeth', 'F', '05-MAY-57', 'SPOUSE' );
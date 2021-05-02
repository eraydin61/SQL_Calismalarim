create table EMPLOYEE
	( fname		varchar(15)	not null,
	  minit		char,
	  lname		varchar(15)	not null,
	  ssn		char(9)		primary key not null,
	  bdate		date,
	  address	varchar(30),
	  sex		char,
	  salary	decimal(10,2),
	  super_ssn	char(9),
	  dno		int		not null);
	  
create table DEPARTMENT
	( dname		varchar(15)	unique not null,
	  dnumber	int		primary key not null,
	  mgr_ssn	char(9),
	  mgr_start_date	date);

alter table EMPLOYEE
	add foreign key(super_ssn) references EMPLOYEE(ssn);


alter table EMPLOYEE
	add  foreign key(dno) references DEPARTMENT(dnumber);


alter table DEPARTMENT
	add  foreign key(mgr_ssn) references EMPLOYEE(ssn);



create table DEPT_LOCATIONS
	( dnumber	int		references DEPARTMENT(dnumber) not null,
	  dlocation	varchar(15)	not null,
	primary key (dnumber,dlocation));


create table PROJECT
	( pname		varchar(15)	unique not null,
	  pnumber	int		primary key not null,
	  plocation	varchar(15),
	  dnum		int		references DEPARTMENT(dnumber) );


create table WORKS_ON
	( essn		char(9)		references EMPLOYEE(ssn) not null,
	  pno		int		references PROJECT(pnumber) not null,
	  hours		decimal(3,1),
	primary key (essn,pno)		);


create table DEPENDENT
	( essn		char(9)		references EMPLOYEE(ssn) not null,
	  dependent_name varchar(15)	not null,
	  sex		char,
	  bdate		date,
	  relationship	varchar(8),
	primary key (essn,dependent_name) );

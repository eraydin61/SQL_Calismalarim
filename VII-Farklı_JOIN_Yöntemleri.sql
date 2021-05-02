-- 'Administration' departmanının yöneticisinin adı, soyadı

-- 1. yöntem
SELECT E.fname, E.lname
FROM EMPLOYEE AS E, DEPARTMENT AS D
WHERE E.ssn = D.mgr_ssn
AND D.dname = 'Administration'

-- 2. yöntem
SELECT E.fname, E.lname
FROM EMPLOYEE AS E JOIN DEPARTMENT AS D ON E.ssn = D.mgr_ssn
WHERE D.dname = 'Administration'

-- 3. yöntem
SELECT fname, lname
FROM EMPLOYEE
WHERE ssn IN (SELECT mgr_ssn FROM DEPARTMENT
			 WHERE dname = 'Administration')

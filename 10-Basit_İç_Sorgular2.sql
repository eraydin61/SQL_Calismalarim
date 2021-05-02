-- 5 numaralı departmanda çalışanların aldığı
-- en yüksek maaştan daha fazla maaş alan
-- çalışanların listesi


-- Alt sorgu : 5 nolu departmandaki en yüksek maaş
SELECT MAX(salary)
FROM EMPLOYEE
WHERE dno = 5

-- İstenen sorgu
SELECT *
FROM EMPLOYEE
WHERE salary > ( SELECT MAX(salary)
				 FROM EMPLOYEE
			     WHERE dno = 5)

-- 'Research' isimli departmanda çalışanların
-- aldıkları ücretten daha fazla kazanan 
-- çalışanların listesi (aynı sorgu!)
SELECT *
FROM EMPLOYEE
WHERE salary > ( SELECT MAX(salary)
				 FROM EMPLOYEE
			     WHERE dno = (SELECT dnumber
				              FROM DEPARTMENT
							  WHERE dname = 'Research'))

-- Veya;
SELECT *
FROM EMPLOYEE
WHERE salary > ( SELECT MAX(salary)
				 FROM EMPLOYEE, DEPARTMENT
			     WHERE EMPLOYEE.dno = DEPARTMENT.dnumber
				 AND DEPARTMENT.dname = 'Research' )
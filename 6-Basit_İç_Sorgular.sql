-- En fazla ücret alan çalışanın
-- adı soyadı doğum tarihi ve aldığı ücret
SELECT fname, lname, bdate, salary
FROM EMPLOYEE
WHERE salary = ( SELECT MAX(salary) FROM EMPLOYEE)

-- Ortalama maaşın üzerinde ücret alan
-- çalışanların listesi
SELECT fname, lname, bdate, salary
FROM EMPLOYEE
WHERE salary > ( SELECT AVG(salary) FROM EMPLOYEE)

-- Research departmanında çalışanların
-- ortalama maaş bilgisi
SELECT AVG(salary)
FROM EMPLOYEE
WHERE dno = (SELECT dnumber FROM DEPARTMENT 
			 WHERE dname = 'Research')

-- İsminde "h" harfi geçen departmanlarda
-- çalışanların sayısı
SELECT COUNT(*) FROM EMPLOYEE
WHERE dno IN ( SELECT dnumber
			  FROM DEPARTMENT
			  WHERE dname LIKE '%q%')

-- 25000 veya 38000 ücret alan 
-- çalışanların listesi
SELECT * FROM EMPLOYEE
WHERE salary IN (25000, 38000)

-- Bir üstteki ile aynı sorgu
SELECT * FROM EMPLOYEE
WHERE salary = 25000 or salary = 38000

-- Yöneticisinin isminde "e" harfi geçen
-- çalışanların listesi
SELECT * FROM EMPLOYEE
WHERE super_ssn IN ( SELECT ssn FROM EMPLOYEE
					 WHERE fname LIKE '%e%' )
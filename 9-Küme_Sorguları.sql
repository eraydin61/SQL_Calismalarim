-- Öyle proje numaraları listelensin ki;
-- 'Smith' soyadına sahip bir proje çalışanı olsun
-- VEYA
-- Projenin yürütücü departmanının müdürününü soyadı
-- 'Smith' olsun.


-- 1. alt sorgu : 'Smith' soyadına sahip bir çalışanı
-- olan projelerin numaraları
SELECT p.pnumber
FROM PROJECT AS p, WORKS_ON AS w, EMPLOYEE AS e
WHERE p.pnumber = w.pno AND w.essn = e.ssn
AND e.lname = 'Smith'

-- 2. alt sorgu : Yürütücü departmanının müdürünün
-- soyadı 'Smith' olan proje numaraları
SELECT p.pnumber
FROM PROJECT AS p, DEPARTMENT AS d, EMPLOYEE AS e
WHERE p.dnum = d.dnumber AND d.mgr_ssn = e.ssn
AND e.lname = 'Smith'

-- İstenen sorgu
SELECT pnumber
FROM PROJECT
WHERE pnumber IN ( SELECT p.pnumber
				FROM PROJECT AS p, WORKS_ON AS w, EMPLOYEE AS e
				WHERE p.pnumber = w.pno AND w.essn = e.ssn
				AND e.lname = 'Smith')
OR
	  pnumber IN (SELECT p.pnumber
					FROM PROJECT AS p, DEPARTMENT AS d, EMPLOYEE AS e
					WHERE p.dnum = d.dnumber AND d.mgr_ssn = e.ssn
					AND e.lname = 'Smith')


-- Aynı sorgu küme mantığı ile şöyle yazılabilir
( SELECT p.pnumber
					FROM PROJECT AS p, WORKS_ON AS w, EMPLOYEE AS e
					WHERE p.pnumber = w.pno AND w.essn = e.ssn
					 AND e.lname = 'Smith')
UNION 
	   (SELECT p.pnumber
					FROM PROJECT AS p, DEPARTMENT AS d, EMPLOYEE AS e
					WHERE p.dnum = d.dnumber AND d.mgr_ssn = e.ssn
					AND e.lname = 'Smith')

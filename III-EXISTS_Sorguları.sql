-- EXISTS ve NOT EXISTS örnek sorgular

-- Kendisiyle aynı isme ve aynı cinsiyete sahip
-- bir akrabası olan çalışanların ad ve soyadları

SELECT e.Fname, e.Lname
FROM EMPLOYEE AS e
WHERE EXISTS ( SELECT * FROM DEPENDENT AS d
			   WHERE d.essn = e.ssn  AND
					 d.dependent_name = e.fname AND
					 d.sex = e.sex )

-- Hiç akraba kaydı olmayan çalışanların ad ve soyadları
SELECT e.Fname, e.Lname
FROM EMPLOYEE AS e
WHERE NOT EXISTS ( SELECT * FROM DEPENDENT AS d
			   WHERE d.essn = e.ssn  )

-- 2.yöntem (eşleşmeyen kayıtlar sorulduğu için LEFT JOIN)
SELECT e.Fname, e.Lname
FROM EMPLOYEE AS e LEFT JOIN DEPENDENT AS d ON e.ssn = d.essn
WHERE d.essn IS NULL
ORDER BY e.Lname

-- En azından bir akraba kaydı olan departman müdürlerinin
-- ad, soyad, departman bilgileri

-- 1. yaklaşım (öyle çalışanları listele ki;
				-- departman müdürü olsun
				-- VE
				-- en az bir akraba kaydı olsun )

SELECT E.fname, E.lname
FROM EMPLOYEE AS E
WHERE 
EXISTS ( SELECT * FROM DEPARTMENT AS d
			   WHERE e.ssn = d.mgr_ssn)
AND 

EXISTS ( SELECT * FROM DEPENDENT AS dp
			   WHERE e.ssn = dp.essn)


-- 2. yaklaşım : Departman isminin de rapora yansıması için
-- ana sorguda EMPLOYEE ve DEPARTMENT tabloları birleştirilmeli
-- ve departman müdürü olan çalışanlar ana sorguda seçilmeli
-- bu çalışanların iç sorguda akraba kayıtları aranmalı.
SELECT E.fname, E.lname, D.dname
FROM EMPLOYEE AS E, DEPARTMENT AS D
WHERE E.ssn = D.mgr_ssn AND
EXISTS ( SELECT * FROM DEPENDENT AS dp
			   WHERE e.ssn = dp.essn)

-- 3. yöntem: Tüm tablolar JOIN edilebilir, iç sorguya gerek kalmaz
SELECT DISTINCT E.fname, E.lname, D.dname
FROM EMPLOYEE AS E, DEPARTMENT AS D, DEPENDENT AS Dp
WHERE E.ssn = D.mgr_ssn AND Dp.essn = E.ssn

-- Hiçbir projede görevi olmayan çalışanlar
SELECT E.fname, E.lname
FROM EMPLOYEE AS E
WHERE  NOT EXISTS ( SELECT * FROM WORKS_ON AS w
				   WHERE E.ssn = W.essn)

-- En az 2 tane projede görev alan çalışanlar
SELECT E.fname, E.lname
FROM EMPLOYEE AS E
WHERE ( SELECT COUNT(*) FROM WORKS_ON AS W
			 WHERE E.ssn = W.essn ) >= 2


-- 5 numaralı departmanın yürüttüğü projelerin
-- hepsinde birden görev alan çalışanların listesi
SELECT E.fname, E.lname
FROM EMPLOYEE AS E
WHERE NOT EXISTS 
(
			(SELECT Pnumber FROM PROJECT WHERE dnum=5)
			EXCEPT
			(SELECT Pno FROM WORKS_ON AS W Where E.ssn = W.essn) 
)

-- 2. yöntem :
-- YAKLAŞIM CÜMLESİ :
-- Bana öyle çalışanları listele ki;
-- bu çalışanların görev almadığı bir 5.nolu dept.
-- projesi olmasın.
SELECT E.Fname, E.Lname
FROM EMPLOYEE AS E
WHERE NOT EXISTS ( SELECT * FROM WORKS_ON AS W1
					WHERE (W1.pno IN (SELECT Pnumber
									  FROM PROJECT	
									  WHERE dnum = 5)
					AND
					NOT EXISTS (SELECT *
								FROM WORKS_ON W2
								WHERE W2.essn = E.ssn
								AND W2.pno = W1.pno)))





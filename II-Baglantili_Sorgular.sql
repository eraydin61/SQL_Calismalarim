-- Bağlantılı iç sorgular 
-- (Correlated Nested Queries)

-- Kendisiyle aynı isme ve aynı cinsiyete sahip
-- bir akrabası olan çalışanların ad ve soyadları

SELECT e.fname, e.lname
FROM EMPLOYEE AS e, DEPENDENT AS d
WHERE e.ssn = d.essn
AND e.fname = d.dependent_name
AND e.sex = d.sex

-- Veya (bağlantılı iç sorgu ile)
-- Bu tip iç sorgular
-- Dış sorgudaki her bir kayıt için
-- tekrar tekrar çalışır (döngülere benzer)
SELECT e.fname, e.lname
FROM EMPLOYEE AS e
WHERE e.ssn IN ( SELECT Essn
				 FROM DEPENDENT AS d
				 WHERE d.dependent_name = e.fname
				 AND d.sex = e.sex )
				 

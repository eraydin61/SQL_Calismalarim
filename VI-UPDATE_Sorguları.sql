-- UPDATE SORGULARI

-- Tüm çalışanların maaşını 36000 yapan sorgu
UPDATE EMPLOYEE
SET salary = 36000

-- '666884444' ssn numaralı çalışanın
-- maaş ve adres değişimi
UPDATE EMPLOYEE
SET salary = 51200,
	address = '433 Kingston, Dallas, TX'
WHERE ssn = '666884444'


-- Birincil anahtar değeri değişirse;
-- ilgili yabancı anahtar kuralları
-- CASCADE, SET NULL veya DEFAULT seçilmelidir!
UPDATE EMPLOYEE
SET ssn = '777777777'
WHERE ssn = '123456789'

-- 'Research' departmanında çalışanların
-- maaşlarına %10 zam yapan sorgu
UPDATE EMPLOYEE
SET salary = salary * 1.1
WHERE dno IN (SELECT dnumber
			  FROM DEPARTMENT
			  WHERE dname = 'Research')

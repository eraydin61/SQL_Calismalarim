-- DELETE Sorguları

-- Ör: Tüm EMPLOYEE tablosunun silinmesi!
-- Diger tablolarda yabancı anahtar kuralları :
-- CASCADE --> Diger tablolardaki ilgili kayıtlar da silinir!
-- SET NULL --> Diger tablolarda kayıtlar silinmez. Yabancı 
-- anahtar değeri NULL yapılır.
DELETE FROM EMPLOYEE

-- Soyadı 'Brown' olan çalışanların tablodan silinmesi
DELETE FROM EMPLOYEE
WHERE Lname = 'Brown'

-- 'Research departmanında çalışanların silinmesi
DELETE FROM EMPLOYEE
WHERE dno IN (SELECT dnumber
				FROM DEPARTMENT
				  WHERE dname = 'Research')

--- '777777777' ssn numaralı kişinin silinmesi
-- DEPARTMENT tablosunda müdür olduğu departman için ilgili alan NULL
-- WORKS_ON ve DEPENDENT tablolarında ilgili kayıtlar silinir (CASCADE)
DELETE FROM EMPLOYEE
WHERE ssn = '777777777'



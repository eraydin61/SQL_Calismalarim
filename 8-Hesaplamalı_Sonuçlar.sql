-- 30000'den az ücret alan çalışanların
-- ücretlerinin %15 zam eklenmiş raporu 
-- (gerçek veri değişmiyor, sadece raporlama)
SELECT ssn, fname, lname, salary, salary*1.15 AS ZamlıÜcret
FROM EMPLOYEE
WHERE salary <= 30000


-- Tüm çalışanların toplam maaşı
SELECT SUM(salary) AS ToplamMaaş
FROM EMPLOYEE

-- En yüksek maaş
SELECT MAX(salary) AS EnYüksek
FROM EMPLOYEE

-- En düşük maaş
SELECT MIN(salary) AS EnDüşük
FROM EMPLOYEE

-- Ortalama maaş
SELECT AVG(salary) AS Ortalama
FROM EMPLOYEE

-- Çalışan sayısı
SELECT COUNT(*) AS ÇalışanSayısı
FROM EMPLOYEE


-- Kadın çalışanların sayısı
SELECT COUNT(*) AS ÇalışanSayısı
FROM EMPLOYEE
WHERE sex = 'F'

-- Kaç farklı maaş değeri var?
SELECT COUNT(DISTINCT salary)
FROM EMPLOYEE

-- Farklı maaş değerleri (azalan sırada)
SELECT DISTINCT salary
FROM EMPLOYEE
ORDER BY salary DESC

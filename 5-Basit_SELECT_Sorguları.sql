-- Tüm çalışanları listeleme
SELECT * FROM EMPLOYEE

-- Tüm çalışanların ad ve ssn bilgileri
SELECT fname,ssn FROM EMPLOYEE

-- Ücret olarak 30000'den az kazanan
-- erkek çalışanların ad, soyad, ssn ve ücret bilgileri
SELECT fname, lname, ssn, salary 
FROM EMPLOYEE
WHERE salary < 30000 and sex = 'M'


-- İsmi A harfi ile başlayan çalışanlar
SELECT *
FROM EMPLOYEE
WHERE fname LIKE 'A%'

-- İsminde en az A harfi geçen çalışanlar
SELECT *
FROM EMPLOYEE
WHERE fname LIKE '%A%'

-- İsminde en az iki A harfi geçen çalışanlar
SELECT *
FROM EMPLOYEE
WHERE fname LIKE '%A%A%'

-- Baştan 2. harfi L olan çalışanlar
SELECT *
FROM EMPLOYEE
WHERE fname LIKE '_L%'

-- İsmi 5 harfli olan ve S ile biten çalışanlar
SELECT *
FROM EMPLOYEE
WHERE fname LIKE '____S'

-- Houston'da ikamet eden çalışanlar
SELECT *
FROM EMPLOYEE
WHERE address LIKE '%Houston%'
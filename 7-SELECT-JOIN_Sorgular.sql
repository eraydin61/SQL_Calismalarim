-- Research departmanında çalışanların
-- ad, soyad, adres, doğum tarihi ve
-- departman isim bilgileri
SELECT e.fname, e.lname, e.address, e.bdate, d.dname
FROM EMPLOYEE AS e, DEPARTMENT AS d
WHERE e.dno = d.dnumber
AND d.dname = 'Research'

-- 2. yöntem (iç sorgu ile)
SELECT e.fname, e.lname, e.address, e.bdate
FROM EMPLOYEE AS e
WHERE e.dno = (SELECT dnumber FROM DEPARTMENT
				WHERE dname = 'Research')

-- Her çalışan için;
-- Çalışanın adı, soyadı, amirinin adı, soyadı
SELECT calisan.fname AS CalisanAd, calisan.lname AS CalisanSoyad, amir.fname AS AmirAd, amir.lname AS AmirSoyad
FROM EMPLOYEE AS calisan, EMPLOYEE AS amir
WHERE calisan.super_ssn = amir.ssn
ORDER BY CalisanAd

-- Üstteki sorgu ile aynı işi yapan 
-- SELECT..JOIN sorgusu
SELECT calisan.fname AS CalisanAd, calisan.lname AS CalisanSoyad, amir.fname AS AmirAd, amir.lname AS AmirSoyad
FROM EMPLOYEE AS calisan JOIN EMPLOYEE AS amir ON calisan.super_ssn = amir.ssn
ORDER BY CalisanAd

-- Çalışanlar ve amirleri
-- Amiri olmayan çalışanlar da listelensin
-- (Çalışan tablosu -join ifadesinde soldaki tablo- korunsun!)
SELECT calisan.fname AS CalisanAd, calisan.lname AS CalisanSoyad, amir.fname AS AmirAd, amir.lname AS AmirSoyad
FROM EMPLOYEE AS calisan LEFT JOIN EMPLOYEE AS amir ON calisan.super_ssn = amir.ssn
ORDER BY CalisanAd

-- Çalışanlar ve amirleri
-- Amirlik yapmayan kişiler de listelensin
-- (Amir tablosu -join ifadesinde sağdaki tablo- korunsun!)
SELECT calisan.fname AS CalisanAd, calisan.lname AS CalisanSoyad, amir.fname AS AmirAd, amir.lname AS AmirSoyad
FROM EMPLOYEE AS calisan RIGHT JOIN EMPLOYEE AS amir ON calisan.super_ssn = amir.ssn
ORDER BY CalisanAd

-- Çalışanlar ve amirleri
-- Tüm eşleşmeler (çalışan, amir) +
-- Amirlik yapmayanlar + amiri olmayanlar listelensin
-- (Her iki tablo da korunsun!)
SELECT calisan.fname AS CalisanAd, calisan.lname AS CalisanSoyad, amir.fname AS AmirAd, amir.lname AS AmirSoyad
FROM EMPLOYEE AS calisan FULL JOIN EMPLOYEE AS amir ON calisan.super_ssn = amir.ssn
ORDER BY CalisanAd

-- Amiri olmayan çalışanların ad ve soyadı
SELECT fname, lname
FROM EMPLOYEE
WHERE super_ssn IS NULL


-- "ProductX" isimli projede çalışanların
-- ad, soyad, maaş bilgileri
SELECT e.fname, e.lname, e.salary
FROM EMPLOYEE AS e, PROJECT AS p, WORKS_ON as w
WHERE w.essn = e.ssn AND w.pno = p.pnumber
AND p.pname = 'ProductX'



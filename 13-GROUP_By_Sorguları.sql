-- SELECT sorguları : Kayıtları gruplama (GROUP BY)

-- Her bir cinsiyet için çalışan sayısı
SELECT sex AS Cinsiyet, COUNT(*) AS CalisanSayisi
FROM EMPLOYEE
GROUP BY sex

-- Her bir departman için;
-- Departman adı, çalışan sayısı, ortalama maaş
SELECT dno, dname, COUNT(*) AS CalisanSayisi, AVG(salary) AS OrtalamaÜcret
FROM EMPLOYEE, DEPARTMENT
WHERE dno = dnumber
GROUP BY dno, dname

-- Her bir departmanda çalışan M/F sayısı
SELECT dno, dname, sex AS Cinsiyet, COUNT(*) AS CalisanSayisi
FROM EMPLOYEE, DEPARTMENT
WHERE dno = dnumber
GROUP BY dno, dname, sex
ORDER BY dno

-- Her bir proje için;
-- Proje numarası, proje adı, çalışan sayısı, toplam çalışma süresi
SELECT P.pnumber, P.pname, COUNT(*) AS CalisanSayisi, SUM(W.hours) AS ToplamCalismaSaati
FROM PROJECT AS P, WORKS_ON W
WHERE P.pnumber = W.pno
GROUP BY P.pnumber, P.pname
ORDER BY ToplamCalismaSaati DESC

-- Toplam çalışan sayısı 3 veya daha fazla olan her bir proje için;
-- Proje numarası, proje adı, çalışan sayısı, toplam çalışma süresi
-- Grupların filtrelenmesi : HAVING
SELECT P.pnumber, P.pname, COUNT(*) AS CalisanSayisi, SUM(W.hours) AS ToplamCalismaSaati
FROM PROJECT AS P, WORKS_ON W
WHERE P.pnumber = W.pno
GROUP BY P.pnumber, P.pname
HAVING COUNT(*) >= 3
ORDER BY ToplamCalismaSaati DESC

-- Her bir proje için;
-- Proje numarası, proje adı ve
-- O projede görev alan 5.nolu dept. çalışanı sayısı
SELECT P.pnumber, P.pname, COUNT(*) AS CalisanSayisi
FROM PROJECT AS P, WORKS_ON W, EMPLOYEE AS E
WHERE P.pnumber = W.pno AND E.ssn = W.essn
	  AND E.dno = 5
GROUP BY P.pnumber, P.pname

-- En az 3 projede görev alan çalışanlar için:
-- Her bir çalışanın ssn numarası, adı, soyadı,
-- çalıştığı proje sayısı, toplam çalışma saati
SELECT E.ssn, E.fname, E.lname, COUNT(*) As ProjeSayisi, SUM(W.hours) AS ToplamCalismaSüresi
FROM EMPLOYEE AS E, WORKS_ON AS W
WHERE E.ssn = W.essn
GROUP BY E.ssn, E.fname, E.lname
HAVING COUNT(*) >=3
ORDER BY ToplamCalismaSüresi DESC

-- 40.000'den fazla ücret alan çalışanlarının
-- sayısı 3 ve daha fazla olan departmanların listesi
SELECT D.dname, COUNT(*) AS CalisanSayisi
FROM DEPARTMENT AS D, EMPLOYEE AS E
WHERE D.dnumber = E.dno AND E.salary>=40000
GROUP BY dname
HAVING COUNT(*)>=3


-- Çalışan sayısı 3'ün üzerinde olan departmanlar için,
-- o departmanlarda 40.000'den fazla ücret alan çalışan sayısı
SELECT D.Dnumber, COUNT(*) AS CalisanSayisi
FROM DEPARTMENT AS D, EMPLOYEE AS E
WHERE D.dnumber = E.dno AND Salary>=40000
AND Dno IN (SELECT Dno FROM EMPLOYEE
			GROUP BY dno 
			HAVING COUNT(*)>=3)
GROUP BY D.Dnumber
			
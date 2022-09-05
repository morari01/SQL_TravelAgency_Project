--PODZAPYTANIA
--1  Imię,nazwisko,panstwo i cena dla klientow, którzy kupili najtańszą wycieczkę
SELECT IMIE, NAZWISKO, PANSTWO, CENA 
FROM Klienci k JOIN Sprzedaz S ON K.IdKlient=S.IdKlient
JOIN Wycieczki W ON S.IdWycieczkI=W.IdWycieczki
WHERE CENA=(SELECT MIN(CENA) 
			FROM Wycieczki);


--2  Imie,nazwisko klienta,idbiura,cena dla klientow,
--   którzych cena wycieczki wyzsze niż cena wycieczki zakupionej w biurze numer 5
SELECT IMIE, NAZWISKO, BiuroPodrozy_IdBiuro, CENA
FROM Klienci K JOIN Sprzedaz S ON K.IdKlient=S.IdKlient
JOIN Wycieczki W ON S.IdWycieczkI=W.IdWycieczki
WHERE CENA>ALL(SELECT CENA FROM Wycieczki W JOIN Sprzedaz S 
				ON W.IdWycieczki=S.IdWycieczki 
				WHERE BiuroPodrozy_IdBiuro=5)
ORDER BY Cena;


--3  Imie,nazwisko,pesel,numer pasporty tych, ktorzy maja wize 
--   i ona jest wazna mniej niz do 2024 roku
SELECT * FROM Wiza;
SELECT IMIE, NAZWISKO, PESEL, NUMER
FROM KLIENCI K JOIN Paszport P ON K.IdKlient=P.Klienci_IdKlient
WHERE Wiza_IdWiza!=ANY(SELECT IdWiza 
					   FROM WIZA
					   WHERE YEAR(WaznaDo)=2024)
AND  Wiza_IdWiza IS NOT NULL;


--4  Imie,nazwisko,cena i panstwo dla klientow, ktorzy obrali takie
--   same panstwo wycieczki jak klient o numerze 10 
--   i cena wieksza od wyciecki klienta numer 16
select * from Wycieczki;

SELECT imie,nazwisko,cena,panstwo
FROM Klienci k JOIN Sprzedaz S ON K.IdKlient=S.IdKlient
JOIN Wycieczki W ON S.IdWycieczkI=W.IdWycieczki
WHERE w.Panstwo = (SELECT w.Panstwo
			FROM Klienci k JOIN Sprzedaz S ON K.IdKlient=S.IdKlient
			JOIN Wycieczki W ON S.IdWycieczkI=W.IdWycieczki         
            WHERE k.IdKlient = 10)--hiszpanja
AND w.cena < (SELECT w.cena
           FROM Klienci k JOIN Sprzedaz S ON K.IdKlient=S.IdKlient
			JOIN Wycieczki W ON S.IdWycieczkI=W.IdWycieczki         
            WHERE k.IdKlient = 2); --turcja 999


--5
--SZUKA NAZWE HOTELE DLA KTORYCH SREDNIA CENA JEST NAJWIEKSZA
SELECT AVG(CENA), NAZWAHOTELU, Panstwo
FROM Wycieczki W JOIN HOTEL H ON W.Hotel_IdHotelu=H.IdHotelu
GROUP BY NazwaHotelu, Panstwo
HAVING AVG(CENA)>=ALL(SELECT AVG(CENA) 
			FROM Wycieczki W JOIN HOTEL H ON W.Hotel_IdHotelu=H.IdHotelu
			GROUP BY NazwaHotelu, Panstwo);
		

--6
--Policz do ktorego panstwa najwiecej kupuja wycieczki klienci.
SELECT Panstwo, COUNT(*) as ILOSC_KLIENTOW
FROM Wycieczki w JOIN Sprzedaz s ON w.idwycieczki = s.idwycieczki
GROUP BY Panstwo
HAVING COUNT(*)=(SELECT MAX(c.num) 
				 FROM(SELECT COUNT(*) as num   
                  FROM Wycieczki W JOIN Sprzedaz S ON W.idwycieczki = S.idwycieczki
                   GROUP BY W.Panstwo) c);


--7 --Znajdz klienta ktory kupil wycieczke ostatnim
SELECT imie, nazwisko, dataspredazy, panstwo, NazwaHotelu
FROM Sprzedaz s 
JOIN Klienci k ON k.IdKlient=s.IdKlient
JOIN Wycieczki w ON w.IdWycieczki=s.IdWycieczki
JOIN Hotel h ON h.IdHotelu=w.Hotel_IdHotelu
WHERE DataSpredazy=(SELECT MAX(CAST(dataSpredazy as datetime))
FROM Sprzedaz s JOIN Klienci k ON k.IdKlient=s.IdKlient);


------------------------------------PROCEDURY----------------------------------------------------------------------------------------------

--1
-- Procedura przy wstawianiu klienta z PESELEM,imieniem i nazwiskem ktore juz istnieja sprawdza i blokuje ta operacje.
-- Jezeli jego nie istnielo, dodaje jako nowego klienta.
ALTER PROCEDURE sprawdz_pesel
@imie varchar(50),
@nazwisko varchar(50),
@pesel NUMERIC(11,0)
AS BEGIN
	IF NOT EXISTS(SELECT 'X' FROM Paszport P JOIN Klienci k ON p.Klienci_IdKlient=k.IdKlient WHERE PESEL=@pesel)
	BEGIN
		DECLARE @newId INT
		SELECT @newId=MAX(Idklient)+1 FROM Klienci
		INSERT INTO Klienci(IdKlient, Imie, Nazwisko) VALUES (@newId, @imie, @nazwisko)
		INSERT INTO Paszport(IdPaszportu, PESEL, Klienci_IdKlient, Numer) 
		VALUES (@newId, @pesel, @newId, FLOOR(RAND()*(100000-80000+1))+10)
		PRINT 'Wprowadzanie nowego klienta skonczylo sie sukcesem'
	END

	ELSE PRINT 'Taki pesel juz istnieje'
END

EXEC sprawdz_pesel 'Miroslaw', 'KOWALSKI', 55987412652 --juz isnt
EXEC sprawdz_pesel 'Agnieszka','Kowalska', 02223333356 --nie ma

SELECT * FROM Paszport;
SELECT * FROM Klienci;


--2
-- Procedura zmniejsza cene na wycieczke na tyle procentow, ile bylo wprowadzono.
-- Rabat nie moze byc wiekszy niz 20%.
ALTER PROCEDURE rabat_wycieczki
@RABAT INT
AS
DECLARE kurs CURSOR FOR SELECT IdWycieczki, Panstwo, CENA
FROM Wycieczki 
DECLARE @idwycieczki INT, @Panstwo varchar(50), @CENA INT

OPEN kurs
FETCH NEXT FROM kurs INTO @idwycieczki, @panstwo, @CENA
WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE @MIASTO VARCHAR(50), @HOTEL VARCHAR(50), @DATAOD DATE
	SELECT @MIASTO=MIASTO FROM Wycieczki WHERE IdWycieczki=@idwycieczki
	SELECT @HOTEL=NAZWAHOTELU FROM Hotel h INNER JOIN Wycieczki w ON W.Hotel_IdHotelu=H.IdHotelu Where IdWycieczki=@idwycieczki
	SELECT @DATAOD=DATAODJAZDU FROM Wycieczki WHERE IdWycieczki=@idwycieczki
	
	IF (@RABAT>0 AND @RABAT<21)
	BEGIN
	SET @CENA=CAST(@CENA*((100-CAST(@RABAT AS NUMERIC(10,2)))/100) AS NUMERIC(10,2))
	UPDATE Wycieczki SET Cena=@CENA WHERE IdWycieczki=@idwycieczki
	
	PRINT @PANSTWO+', '+ @MIASTO+', w hotelu: '+@HOTEL+', odbywa sie: '+ CONVERT(VARCHAR,@DATAOD)
	+', i kosztuje z rabatem '+convert(varchar,@RABAT)+'% : '+ CONVERT(VARCHAR,@CENA)+' zl.'
	END

	ELSE PRINT @PANSTWO+', '+ @MIASTO+', w hotelu: '+@HOTEL+', odbywa sie: '+ CONVERT(VARCHAR,@DATAOD)
	+', i kosztuje(nie ma rabaru) '+ CONVERT(VARCHAR,@CENA)+' zl.'

	FETCH NEXT FROM kurs INTO @idwycieczki, @panstwo, @CENA
END
CLOSE kurs
DEALLOCATE kurs

exec RABAT_WYCIECZKI 5
SELECT * FROM Wycieczki;


------------------------------------WYZWALACZE---------------------------------------------------------------------------------------------
--1 
-- Jezeli klient nie ma 18 lat, nie zostanie dodany do bazy.
ALTER TRIGGER CHECK_age 
ON KLIENCI
FOR INSERT,UPDATE
AS
begin
	IF ((SELECT year(DataUrodzenia)FROM inserted)>2003)
	BEGIN
	ROLLBACK 
	PRINT 'KLIENT NIE MA 18 LAT'
	END
END

INSERT INTO Klienci VALUES(26, 'Mike', 'Cool', 'M', '2004-10-02', '+480127456', 0);
INSERT INTO Klienci VALUES(29, 'Krzys', 'Cool', 'M', '2000-11-02', '+480127456', 0);

UPDATE Klienci set DataUrodzenia='1998-04-27' where Nazwisko='Kot'
select * from Klienci;


--2
-- Sprawdzamy date sprzedazy wyciecki. Jezeli klient kupil wycieczke 2,1 dni przed lub w dzien odjazdu - otrzyma rabat 10%.
ALTER TRIGGER sprawdz_date_odjazdu
ON Sprzedaz 
FOR INSERT, UPDATE
AS
DECLARE @DataOd Date, @dataSp date, @id int;
BEGIN
	SELECT @dataSp= DataSpredazy FROM inserted;
	SELECT @id = IdSprzedaz from inserted;
	SELECT @dataod = DataOdjazdu FROM Wycieczki w JOIN Sprzedaz s ON w.IdWycieczki=s.IdWycieczki WHERE @id=s.IdSprzedaz;
	IF((DAY(@DataOd)-DAY(@dataSp)<=2)AND(DAY(@DataOd)-DAY(@dataSp)>=0)
	AND (YEAR(@DataOd)=YEAR(@dataSp))
	AND (MONTH(@dataOd)=MONTH(@dataSp)))
	BEGIN 
		UPDATE Sprzedaz SET Rabat=CAST(0.1 AS NUMERIC(5,2)) WHERE @id=IdSprzedaz
		PRINT 'Zostal wprowadzony rabat'
	END
	ELSE BEGIN ROLLBACK PRINT 'Dla sprzedazy w ten dzien nie ma rabatu' END
END

select * from Wycieczki
select * from Sprzedaz
DELETE FROM Sprzedaz WHERE IdSprzedaz=73
INSERT INTO Sprzedaz VALUES(21,16,10,0,'2021-07-01', 4); --bedzie
INSERT INTO Sprzedaz VALUES(73, 5,1,0,'2021-08-01',1); --nie bd rabatu


--3
-- Dla UPDATE: nie mozna wprowadzac zmiany dla hotelow, jezeli liczba gwiazdek Hotelu bedzie mniej niz 3
-- Dla DELETE: nie mozna usuwac danych z tebeli Hotel
-- Dla INSERT: nie mozna wstawic hotelu z taka sama nazwa ktora juz istnieje
ALTER TRIGGER Hotel_zmiany 
ON HOTEL
AFTER UPDATE, INSERT, DELETE
AS
DECLARE @Id int,@Nazwa VARCHAR(50), @liczbagw numeric(1,0), @nazwaHotelu varchar(50);
IF EXISTS(SELECT * from inserted) AND EXISTS(SELECT * from deleted) --update
BEGIN
	SELECT @liczbagw=LiczbaGwiazdek from inserted i;
	SELECT @ID = IdHotelu from inserted i;
	SELECT @NAZWA=NazwaHotelu from inserted i;
	IF(@liczbagw<3) BEGIN 
	ROLLBACK PRINT 'Nie mozna updatowac hotelow ktorych liczba gwiazdek mniej niz 3'
	END

	ELSE BEGIN
	UPDATE Hotel SET LiczbaGwiazdek=@liczbagw WHERE @id=IdHotelu
	PRINT 'Nowa liczba gwiazdek zostala ustalona' 
	END
END

IF EXISTS(Select * from inserted) AND NOT EXISTS(Select * from deleted) --insert
BEGIN
	
	SELECT @ID = IdHotelu from inserted i;
	SELECT @liczbagw=LiczbaGwiazdek from inserted i;
	SELECT @nazwa = NazwaHotelu from inserted i;

	IF NOT EXISTS(SELECT 'x' FROM inserted WHERE @id=IdHotelu AND @nazwa=NazwaHotelu)
	BEGIN 
	UPDATE Hotel SET NazwaHotelu=@nazwa WHERE @id=IdHotelu
	PRINT 'Zostal dodany nowy hotel'
	END

	ELSE begin ROLLBACK PRINT 'Nie mozna insertowac takiej samej nazwy' end

END

IF EXISTS(select * from deleted) AND NOT EXISTS(Select * from inserted) --delete
BEGIN
    ROLLBACK
	PRINT 'Nie mozna usuwac rekordow z tabeli Hotel!'
END


--dla update
UPDATE HOTEL set LiczbaGwiazdek=2 where IdHotelu=1;--nie zmieni
UPDATE HOTEL set LiczbaGwiazdek=4 where IdHotelu=1;--zmieni


--dla insert
INSERT INTO Hotel VALUES(15, 'Warwick New York',3) --juz isnije taki hotel
INSERT INTO Hotel VALUES(16, 'New Hotel', 4) --nowa nazwa


--dla delete
INSERT INTO Hotel VALUES(12,'Walk Warsaw',5);
INSERT INTO Wycieczki VALUES(12,'Polska','Warszawa','2022-06-06','2022-06-15',1, 100, 12)
INSERT INTO Sprzedaz VALUES(22,20,12,0,'2020-03-03',5) --najpierw dodamy przykladowe dane

DELETE FROM Sprzedaz WHERE IdSprzedaz=22;
DELETE FROM Wycieczki WHERE IdWycieczki=12;
DELETE FROM Hotel WHERE IdHotelu=12; --nie usunie

select * from Hotel
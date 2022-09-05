
SELECT * FROM Klienci;
SELECT * FROM Paszport;
SELECT * FROM Wiza;
SELECT * FROM Biuropodrozy;
SELECT * FROM Adres;
SELECT * FROM Hotel;
SELECT * FROM Autobus;
SELECT * FROM Samolot;
SELECT * FROM SrodekTransportowy;
SELECT * FROM Wycieczki;
SELECT * FROM Sprzedaz;



--Tabela KLIENCI
INSERT INTO Klienci VALUES(1, 'Krzystian', 'Owczarek', 'M', '2000-10-02', '+480123456', 0);
INSERT INTO Klienci VALUES(2, 'Miroslaw', 'Sikorski', 'M', '1988-06-23', '+480112233', 2);
INSERT INTO Klienci VALUES(3, 'Dominika', 'Kowal', 'K', '1996-12-13', '+480556980',3);
INSERT INTO Klienci VALUES(4, 'Martyna', 'Czyz', 'K', '04-04-1978', '+480115165', 4);
INSERT INTO Klienci VALUES(5, 'Barbara', 'Zielinska', 'K', '2003-10-30', '+480478996', 1);
INSERT INTO Klienci VALUES(6, 'Anastasiia', 'Orlova', 'K', '1995-09-05', '+480565253', 1);
INSERT INTO Klienci VALUES(7, 'Danylo', 'Orlov', 'M', '1994-01-02', '+480142489', 1);
INSERT INTO Klienci VALUES(8, 'Pawel', 'Nowicki', 'M', '1965-03-28', '+480323655', 6);
INSERT INTO Klienci VALUES(9, 'Filip', 'Glowacki', 'M', '2001-08-16', '+480117747', 2);
INSERT INTO Klienci VALUES(10, 'Adrian', 'Sikorski', 'M', '1991-02-14', '+480508477', 0);
INSERT INTO Klienci VALUES(11,'Tomasz', 'Gawkowski','M', '2002-07-28', '+480697412', 1);
INSERT INTO Klienci VALUES(12, 'Andzej', 'Kowal', 'M', '1978-05-18', '+480563247', 4);
INSERT INTO Klienci VALUES(13, 'Pawel', 'Dabrowski', 'M', '2000-01-11', '+480125889', 0);
INSERT INTO Klienci VALUES(14, 'Ewa', 'Lewandowska', 'K', '1986-04-07', '+480988531', 2);
INSERT INTO Klienci VALUES(15, 'Martyna', 'Wicha', 'K', '1973-10-28', '+480149873', 3);
INSERT INTO Klienci VALUES(16, 'Aleksanda', 'Goral', 'K', '2010-01-01', '+480256589', 0);
INSERT INTO Klienci VALUES(17, 'Krzysztof', 'Goral', 'M', '1988-11-22', '+448610236', 0);
INSERT INTO Klienci VALUES(18, 'Anna', 'Goral', 'K', '1990-06-30', '+449862541', 0);
INSERT INTO Klienci VALUES(19, 'Maria', 'Szulc', 'K', '1963-12-16', '+480257911', 2);
INSERT INTO Klienci VALUES(20, 'Beata', 'Kot', 'K', '1999-04-27', '+480152469', 1);

--Tabela WIZA
INSERT INTO Wiza VALUES(1, 265984, 'B1','2020-04-08', '2022-04-08', 'USA');
INSERT INTO Wiza VALUES(2, 265636, 'B2', '2019-03-06', '2023-03-06', 'Kanada');
INSERT INTO Wiza VALUES(3, 694812, 'C','2018-09-27', '2023-09-27', 'USA');
INSERT INTO Wiza VALUES(4, 141565, 'B2','2020-05-01', '2024-05-01', 'Kanada');
INSERT INTO Wiza VALUES(5, 112233, 'A2','2021-08-01', '2021-11-01',  'Maldives');
INSERT INTO Wiza VALUES(6, 223366, 'A2','2021-07-01', '2021-10-01',  'Maldives');

--Tabela Paszport
INSERT INTO Paszport VALUES(1, 'JT5089475', 12659874512, '2012-06-27', '2022-06-27',1,1);
INSERT INTO Paszport VALUES(2, 'HJ5569874', 65987412653, '2018-12-13', '2028-12-13',2, NULL);
INSERT INTO Paszport VALUES(3, 'DJ2355969', 25269874644, '2020-05-05', '2030-05-05',3,NULL);
INSERT INTO Paszport VALUES(4, 'GH2323653', 26589432561, '2014-10-30', '2024-10-30',4,NULL);
INSERT INTO Paszport VALUES(5, 'AF8900923', 20368094756, '2019-02-19', '2029-02-19',5,2);
INSERT INTO Paszport VALUES(6, 'KJ5263998', 10565899743, '2014-08-25', '2024-08-25',6,5);
INSERT INTO Paszport VALUES(7, 'KD5690020', 56532469851, '2016-03-25', '2026-03-25',7,6);
INSERT INTO Paszport VALUES(8, 'KD5239874', 02369874516, '2021-01-01', '2031-01-01',8,NULL);
INSERT INTO Paszport VALUES(9, 'LK5656521', 36458712102, '2019-04-13', '2029-04-13',9,NULL);
INSERT INTO Paszport VALUES(10, 'PO5689412', 22365587411, '2020-12-12', '2030-12-12',10,NULL);
INSERT INTO Paszport VALUES(11, 'LL630136', 49852625481, '2018-10-15', '2018-10-15',11,NULL);
INSERT INTO Paszport VALUES(12, 'OK45126', 6569932456, '2013-08-29', '2023-08-29',12,NULL);
INSERT INTO Paszport VALUES(13, 'GHJ10225', 125365111, '2021-05-05', '2031-05-05',13,NULL);
INSERT INTO Paszport VALUES(14, 'DS12451', 985654614, '2015-09-17','2025-09-17',14,3);
INSERT INTO Paszport VALUES(15, 'AD454545', 23614956, '2014-10-31', '2024-10-31',15,NULL);
INSERT INTO Paszport VALUES(16, 'AA489631', 128766543, '2013-02-19', '2023-02-19',16,NULL);
INSERT INTO Paszport VALUES(17, 'GF584123', 5612384962, '2018-12-14', '2028-12-14',17,NULL);
INSERT INTO Paszport VALUES(18, 'KL48956', 154895626, '2012-06-24', '2022-06-24',18,NULL);
INSERT INTO Paszport VALUES(19, 'FUJ5984', 154849563,  '2019-02-28', '2029-02-28',19,4);
INSERT INTO Paszport VALUES(20, 'AUF6667', 489236612, '2015-08-11', '2025-08-11',20,NULL);



--Tabela Biuro
INSERT INTO Biuropodrozy VALUES(1, '+480505050');
INSERT INTO Biuropodrozy VALUES(2, '++48060060');
INSERT INTO Biuropodrozy VALUES(3, '+480121213');
INSERT INTO Biuropodrozy VALUES(4, '+48090909');
INSERT INTO Biuropodrozy VALUES(5, '+421060700');
INSERT INTO Biuropodrozy VALUES(6, '+49181818');
INSERT INTO Biuropodrozy VALUES(7, '+49171717');
INSERT INTO Biuropodrozy VALUES(8, '+49131313');
INSERT INTO Biuropodrozy VALUES(9, '+420303655');
INSERT INTO Biuropodrozy VALUES(10, '+420656565');


--Tabela Adres
INSERT INTO Adres VALUES(1, 'Polska', 'Warszawa', 'ul.Arbuzowa', 51, 1);
INSERT INTO Adres VALUES(2, 'Polska', 'Warszawa', 'ul.Korczycska', 12, 2);
INSERT INTO Adres VALUES(3, 'Polska', 'Lodz', 'ul.Maratocska', 131, 3);
INSERT INTO Adres VALUES(4, 'Polska', 'Lublin', 'ul.Biala', 23, 4);
INSERT INTO Adres VALUES(5, 'Slowacja', 'Bratyslawa', 'ul.Drulstvena', 45, 5);
INSERT INTO Adres VALUES(6, 'Niemcy', 'Berlin', 'ul.Marchclewskistrabe', 266, 6);
INSERT INTO Adres VALUES(7, 'Niemcy', 'Bremen', 'ul.Dulstrabe', 77, 7);
INSERT INTO Adres VALUES(8, 'Niemcy', 'Munchen', 'ul.Bayerstabe', 68, 8);
INSERT INTO Adres VALUES(9, 'Czechy', 'Praga', 'ul.Masarykva', 14, 9);
INSERT INTO Adres VALUES(10,'Czechy', 'Hukvaldy', 'ul.Hlodna', 55, 10);

--Tabela Autobus
INSERT INTO Autobus(IdAutobus, IloscMiejsc) VALUES(1, 16);
INSERT INTO Autobus(IdAutobus, IloscMiejsc) VALUES(2, 52);
INSERT INTO Autobus(IdAutobus, IloscMiejsc) VALUES(3, 30);


--Tabela Samolot
INSERT INTO Samolot(IdSamolot,NumerLotu) VALUES(1, 262622);
INSERT INTO Samolot(IdSamolot,NumerLotu) VALUES(2, 89847);
INSERT INTO Samolot(IdSamolot,NumerLotu) VALUES(3, 56887);
INSERT INTO Samolot(IdSamolot,NumerLotu) VALUES(4, 454984);
INSERT INTO Samolot(IdSamolot,NumerLotu) VALUES(5, 156547);
INSERT INTO Samolot(IdSamolot,NumerLotu) VALUES(6, 98120);
INSERT INTO Samolot(IdSamolot,NumerLotu) VALUES(7, 45782);
INSERT INTO Samolot(IdSamolot,NumerLotu) VALUES(8, 78781);
INSERT INTO Samolot(IdSamolot,NumerLotu) VALUES(9, 269822);
INSERT INTO Samolot(IdSamolot,NumerLotu) VALUES(10, 27789);


--Tabela SrodekTransportowy
INSERT INTO SrodekTransportowy VALUES(1, NULL,1);
INSERT INTO SrodekTransportowy VALUES(2, 1,2);
INSERT INTO SrodekTransportowy VALUES(3, 2,3);
INSERT INTO SrodekTransportowy VALUES(4, NULL,4);
INSERT INTO SrodekTransportowy VALUES(5, NULL,5);
INSERT INTO SrodekTransportowy VALUES(6, 3,6);
INSERT INTO SrodekTransportowy VALUES(7, NULL,7);
INSERT INTO SrodekTransportowy VALUES(8, NULL,8);
INSERT INTO SrodekTransportowy VALUES(9, NULL,9);
INSERT INTO SrodekTransportowy VALUES(10, NULL,10);


--Tabela Hotel
INSERT INTO Hotel VALUES(1, 'Warwick New York', 4);
INSERT INTO Hotel VALUES(2, 'Residence Les Sapins',5);
INSERT INTO Hotel VALUES(3, 'Hilton France',5);
INSERT INTO Hotel VALUES(4, 'Lux Venice Hotel',3);
INSERT INTO Hotel VALUES(5, 'Kelebek Cave Hotel',4);
INSERT INTO Hotel VALUES(6, 'Ilunoin Barcelona',3);
INSERT INTO Hotel VALUES(7, 'Kanarian Lyon',5);
INSERT INTO Hotel VALUES(8, 'Barclay Hotel',4);
INSERT INTO Hotel VALUES(9, 'Paradise Island',5);
INSERT INTO Hotel VALUES(10, 'Sunrise UBUD',3);


--Tabela Wycieczki
INSERT INTO Wycieczki VALUES(1, 'USA', 'NY', '2021-08-02', '2021-08-09', 1, 8400,1);
INSERT INTO Wycieczki VALUES(2, 'Francja', 'Courchevel', '2022-01-06', '2022-01-14', 2, 4650,2);
INSERT INTO Wycieczki VALUES(3, 'Francja', 'Paryz', '2021-09-15', '2021-09-20',3, 1099,3);
INSERT INTO Wycieczki VALUES(4, 'Kanada', 'Vancouver', '2021-10-12', '2021-10-22',4, 10549,4);
INSERT INTO Wycieczki VALUES(5, 'Turcja', 'Kapadocja', '2021-05-15', '2021-05-30', 5, 999,5);
INSERT INTO Wycieczki VALUES(6, 'Hiszpania', 'Barselona', '2021-09-10', '2021-09-20',6, 2080,6);
INSERT INTO Wycieczki VALUES(7, 'Hiszpania', 'Wyspy Kanaryjskie', '2021-07-15', '2021-07-25',7, 3630,7);
INSERT INTO Wycieczki VALUES(8, 'Hiszpania', 'Ibiza', '2021-08-12', '2021-08-20',8, 4200,8);
INSERT INTO Wycieczki VALUES(9, 'Maldives', 'Male', '2021-09-01', '2021-09-15', 9, 16887,9);
INSERT INTO Wycieczki VALUES(10, 'Indonezja', 'Bali-Ubud', '2021-07-02', '2021-07-16', 10, 6969,10);





--Tabela Sprzedaz
INSERT INTO Sprzedaz VALUES(1, 1, 1, 0, '2021-05-05', 1);
INSERT INTO Sprzedaz VALUES(2, 2, 2, 0.03 , '2021-06-03', 5);
INSERT INTO Sprzedaz VALUES(3, 3, 8, 0, '2021-04-03', 4);
INSERT INTO Sprzedaz VALUES(4, 4, 8, 0.05, '2021-04-03',4);
INSERT INTO Sprzedaz VALUES(5, 5, 4, 0, '2021-07-12', 6);
INSERT INTO Sprzedaz VALUES(6, 6, 9, 0, '2021-06-02', 1);
INSERT INTO Sprzedaz VALUES(7, 7, 9, 0, '2021-06-02', 1);
INSERT INTO Sprzedaz VALUES(8, 8, 2, 0.05, '2021-11-24', 8);
INSERT INTO Sprzedaz VALUES(9, 9, 3, 0.03, '2021-07-18', 1);
INSERT INTO Sprzedaz VALUES(10, 10, 7, 0, '2021-05-06', 1);
INSERT INTO Sprzedaz VALUES(11, 11, 7, 0, '2021-04-25', 7);
INSERT INTO Sprzedaz VALUES(12, 12, 10, 0.03,'2021-08-21', 10);
INSERT INTO Sprzedaz VALUES(13, 13, 6, 0, '2021-03-26', 3);
INSERT INTO Sprzedaz VALUES(14, 14, 1, 0.03, '2021-02-01', 8);
INSERT INTO Sprzedaz VALUES(15, 15, 7, 0.03, '2021-05-29', 7);
INSERT INTO Sprzedaz VALUES(16, 16, 5, 0, '2021-02-02', 2);
INSERT INTO Sprzedaz VALUES(17, 17, 5, 0, '2021-02-02', 2);
INSERT INTO Sprzedaz VALUES(18, 18, 5, 0, '2021-02-02', 2);
INSERT INTO Sprzedaz VALUES(19, 19, 4, 0.03, '2021-06-01', 10);
INSERT INTO Sprzedaz VALUES(20, 20, 10, 0, '2021-05-23', 9);


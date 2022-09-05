-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-12-02 17:23:45.333

-- foreign keys
ALTER TABLE Adres DROP CONSTRAINT Adres_BiuroPodrozy;

ALTER TABLE Paszport DROP CONSTRAINT Paszport_Klienci;

ALTER TABLE Paszport DROP CONSTRAINT Paszport_Wiza;

ALTER TABLE Sprzedaz DROP CONSTRAINT SprzedazWycieczek_Klienci;

ALTER TABLE Sprzedaz DROP CONSTRAINT SprzedazWycieczek_Wycieczki;

ALTER TABLE Sprzedaz DROP CONSTRAINT Sprzedaz_BiuroPodrozy;

ALTER TABLE SrodekTransportowy DROP CONSTRAINT SrodekTransp_Autobus;

ALTER TABLE SrodekTransportowy DROP CONSTRAINT SrodekTransp_Samolot;

ALTER TABLE Wycieczki DROP CONSTRAINT Wycieczki_Hotel;

ALTER TABLE Wycieczki DROP CONSTRAINT Wycieczki_SrodekTransportowy;

-- tables
DROP TABLE Adres;

DROP TABLE Autobus;

DROP TABLE BiuroPodrozy;

DROP TABLE Hotel;

DROP TABLE Klienci;

DROP TABLE Paszport;

DROP TABLE Samolot;

DROP TABLE Sprzedaz;

DROP TABLE SrodekTransportowy;

DROP TABLE Wiza;

DROP TABLE Wycieczki;

-- End of file.


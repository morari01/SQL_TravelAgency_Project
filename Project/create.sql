-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-12-02 17:23:35.221

-- tables
-- Table: Adres
CREATE TABLE Adres (
    IdAdres int  NOT NULL,
    Panstwo varchar(50)  NULL,
    Miasto varchar(50)  NULL,
    Ulica varchar(50)  NOT NULL,
    NrBudynku int  NULL,
    BiuroPodrozy_IdBiuro int  NOT NULL,
    CONSTRAINT Adres_pk PRIMARY KEY  (IdAdres)
);

-- Table: Autobus
CREATE TABLE Autobus (
    IdAutobus int  NOT NULL,
    CzasOdjazdu timestamp  NOT NULL,
    IloscMiejsc int  NOT NULL,
    CONSTRAINT Autobus_pk PRIMARY KEY  (IdAutobus)
);

-- Table: BiuroPodrozy
CREATE TABLE BiuroPodrozy (
    IdBiuro int  NOT NULL,
    NumerTelefonu varchar(10)  NOT NULL,
    CONSTRAINT BiuroPodrozy_pk PRIMARY KEY  (IdBiuro)
);

-- Table: Hotel
CREATE TABLE Hotel (
    IdHotelu int  NOT NULL,
    NazwaHotelu varchar(50)  NOT NULL,
    LiczbaGwiazdek int  NOT NULL,
    CONSTRAINT Hotel_pk PRIMARY KEY  (IdHotelu)
);

-- Table: Klienci
CREATE TABLE Klienci (
    IdKlient int  NOT NULL,
    Imie varchar(50)  NOT NULL,
    Nazwisko varchar(50)  NOT NULL,
    Plec char(1)  NULL,
    DataUrodzenia date  NULL,
    NumerTelefonu varchar(10)  NULL,
    LiczbaZakupowWycieczek int  NULL,
    CONSTRAINT Klienci_pk PRIMARY KEY  (IdKlient)
);

-- Table: Paszport
CREATE TABLE Paszport (
    IdPaszportu int  NOT NULL,
    Numer varchar(10)  NULL,
    PESEL numeric(11,0)  NOT NULL,
    DataWydania date  NULL,
    WaznyDo date  NULL,
    Klienci_IdKlient int  NOT NULL,
    Wiza_IdWiza int  NULL,
    CONSTRAINT Paszport_pk PRIMARY KEY  (IdPaszportu)
);

-- Table: Samolot
CREATE TABLE Samolot (
    IdSamolot int  NOT NULL,
    NumerLotu varchar(6)  NOT NULL,
    CzasOdlotu timestamp  NOT NULL,
    CONSTRAINT Samolot_pk PRIMARY KEY  (IdSamolot)
);

-- Table: Sprzedaz
CREATE TABLE Sprzedaz (
    IdSprzedaz int  NOT NULL,
    IdKlient int  NOT NULL,
    IdWycieczki int  NOT NULL,
    Rabat numeric(5,2)  NULL,
    DataSpredazy date  NULL,
    BiuroPodrozy_IdBiuro int  NOT NULL,
    CONSTRAINT Sprzedaz_pk PRIMARY KEY  (IdSprzedaz)
);

-- Table: SrodekTransportowy
CREATE TABLE SrodekTransportowy (
    IdSrodek int  NOT NULL,
    IdAutobus int  NULL,
    IdSamolot int  NULL,
    CONSTRAINT SrodekTransportowy_pk PRIMARY KEY  (IdSrodek)
);

-- Table: Wiza
CREATE TABLE Wiza (
    IdWiza int  NOT NULL,
    NumerWizy numeric(10,0)  NOT NULL,
    TypWizy varchar(15)  NULL,
    DataWydaniaWizy date  NULL,
    WaznaDo date  NULL,
    Panstwo varchar(50)  NULL,
    CONSTRAINT Wiza_pk PRIMARY KEY  (IdWiza)
);

-- Table: Wycieczki
CREATE TABLE Wycieczki (
    IdWycieczki int  NOT NULL,
    Panstwo varchar(50)  NOT NULL,
    Miasto varchar(50)  NOT NULL,
    DataOdjazdu date  NOT NULL,
    DataPrzybycia date  NOT NULL,
    IdSrodek int  NOT NULL,
    Cena int  NOT NULL,
    Hotel_IdHotelu int  NOT NULL,
    CONSTRAINT Wycieczki_pk PRIMARY KEY  (IdWycieczki)
);

-- foreign keys
-- Reference: Adres_BiuroPodrozy (table: Adres)
ALTER TABLE Adres ADD CONSTRAINT Adres_BiuroPodrozy
    FOREIGN KEY (BiuroPodrozy_IdBiuro)
    REFERENCES BiuroPodrozy (IdBiuro);

-- Reference: Paszport_Klienci (table: Paszport)
ALTER TABLE Paszport ADD CONSTRAINT Paszport_Klienci
    FOREIGN KEY (Klienci_IdKlient)
    REFERENCES Klienci (IdKlient);

-- Reference: Paszport_Wiza (table: Paszport)
ALTER TABLE Paszport ADD CONSTRAINT Paszport_Wiza
    FOREIGN KEY (Wiza_IdWiza)
    REFERENCES Wiza (IdWiza);

-- Reference: SprzedazWycieczek_Klienci (table: Sprzedaz)
ALTER TABLE Sprzedaz ADD CONSTRAINT SprzedazWycieczek_Klienci
    FOREIGN KEY (IdKlient)
    REFERENCES Klienci (IdKlient);

-- Reference: SprzedazWycieczek_Wycieczki (table: Sprzedaz)
ALTER TABLE Sprzedaz ADD CONSTRAINT SprzedazWycieczek_Wycieczki
    FOREIGN KEY (IdWycieczki)
    REFERENCES Wycieczki (IdWycieczki);

-- Reference: Sprzedaz_BiuroPodrozy (table: Sprzedaz)
ALTER TABLE Sprzedaz ADD CONSTRAINT Sprzedaz_BiuroPodrozy
    FOREIGN KEY (BiuroPodrozy_IdBiuro)
    REFERENCES BiuroPodrozy (IdBiuro);

-- Reference: SrodekTransp_Autobus (table: SrodekTransportowy)
ALTER TABLE SrodekTransportowy ADD CONSTRAINT SrodekTransp_Autobus
    FOREIGN KEY (IdAutobus)
    REFERENCES Autobus (IdAutobus);

-- Reference: SrodekTransp_Samolot (table: SrodekTransportowy)
ALTER TABLE SrodekTransportowy ADD CONSTRAINT SrodekTransp_Samolot
    FOREIGN KEY (IdSamolot)
    REFERENCES Samolot (IdSamolot);

-- Reference: Wycieczki_Hotel (table: Wycieczki)
ALTER TABLE Wycieczki ADD CONSTRAINT Wycieczki_Hotel
    FOREIGN KEY (Hotel_IdHotelu)
    REFERENCES Hotel (IdHotelu);

-- Reference: Wycieczki_SrodekTransportowy (table: Wycieczki)
ALTER TABLE Wycieczki ADD CONSTRAINT Wycieczki_SrodekTransportowy
    FOREIGN KEY (IdSrodek)
    REFERENCES SrodekTransportowy (IdSrodek);

-- End of file.


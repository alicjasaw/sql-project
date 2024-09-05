// create table.team
CREATE TABLE table.team (
    numer_koszulki int FOREIGN KEY REFERENCES table.dane(numer_koszulki),
    pozycja varchar(5),
    imie_nazwisko varchar (35) PRIMARY KEY,
    wiek int,
    szansa_transfer int
);

// create table.dane
CREATE TABLE table.dane (
    numer_koszulki int PRIMARY KEY,
    kraj_pochodzenia varchar(25),
    reprezentant kraju varchar(1),
    wartosc_rynkowa int,
    kwota transferu int,
    poprzedni_klub_kraj varchar(25)
);
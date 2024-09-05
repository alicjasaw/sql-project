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

// adding data to table.team
INSERT into table.team
VALUES
('1','BR','Thibaut Courtois', '28', '0'),
('13','BR','Andriy Lunin', '21', '2'),
('4','O','Sergio Ramos', '34', '0'),
('6','O','Nacho Fernandez', '30', '2'),
('3','O', 'Eder Militao', '22', '3'),
('8','P','Toni Kroos', '30', '1'),
('15','P','Fede Valverde', '22', '0'),
('14','P','Casemiro', '28', '2'),
('9','N','Karim Benzema', '32', '1'),
('18','N','Luka Jovic', '22', '3');

// adding data to table.dane
INSERT INTO table.dane
VALUES
('1', 'Belgia', 'x', '75', '35', 'Anglia'),
('13', 'Ukraina', 'x', '3', '9', 'Ukraina'),
('4', 'Hiszpania', 'x', '14', '27', 'Hiszpania'),
('6', 'Hiszpania', '', '10', '0', 'wychowanek'),
('3', 'Brazylia', 'x', '40', '50', 'Portugalia'),
('8', 'Niemcy', 'x', '65', '25', 'Niemcy'),
('15', 'Urugwaj', 'x', '70', '0', 'wychowanek'),
('14', 'Brazylia', 'x', '50', '0', 'wychowanek'),
('9', 'Francja', '', '25', '35', 'Francja'),
('18', 'Serbia', 'x', '22', '63', 'Niemcy');
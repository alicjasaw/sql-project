// create table named team
CREATE TABLE team (
    player_number int FOREIGN KEY REFERENCES data(player_number),
    role varchar(5),
    player_name varchar (35) PRIMARY KEY,
    age int,
    transfer_chance int
);

// create table named data
CREATE TABLE data (
    player_number int PRIMARY KEY,
    country varchar(25),
    country_representatives varchar(1),
    market_value int,
    transfer_amount int,
    previous_club_country varchar(25)
);

// adding data to table team
INSERT into team
VALUES
('1','GK','Thibaut Courtois', '28', '0'),
('13','GK','Andriy Lunin', '21', '2'),
('4','D','Sergio Ramos', '34', '0'),
('6','D','Nacho Fernandez', '30', '2'),
('3','D', 'Eder Militao', '22', '3'),
('8','M','Toni Kroos', '30', '1'),
('15','M','Fede Valverde', '22', '0'),
('14','M','Casemiro', '28', '2'),
('9','F','Karim Benzema', '32', '1'),
('18','F','Luka Jovic', '22', '3');

// adding data to table data
INSERT INTO data
VALUES
('1', 'Belgium', 'x', '75', '35', 'England'),
('13', 'Ukraine', 'x', '3', '9', 'Ukraine'),
('4', 'Spain', 'x', '14', '27', 'Spain'),
('6', 'Spain', '', '10', '0', 'alumnus'),
('3', 'Brazil', 'x', '40', '50', 'Portugal'),
('8', 'Germany', 'x', '65', '25', 'Germany'),
('15', 'Uruguay', 'x', '70', '0', 'alumnus'),
('14', 'Brazil', 'x', '50', '0', 'alumnus'),
('9', 'France', '', '25', '35', 'France'),
('18', 'Serbia', 'x', '22', '63', 'Germany');

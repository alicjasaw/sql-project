/// 1. Present the age structure of the team ascending (player_name, age);
SELECT player_name, age
FROM team
ORDER BY age

// 2. Present the age structure for each role DESC (role, player name, age);
SELECT role, player_name, age
FROM team
ORDER BY role, age DESC

// 3. Indicate how many country representatives are in the team (total);
SELECT COUNT(country_representatives) AS numberOfRepresentatives
FROM data
WHERE country_representatives = 'x'

// 4. Present how many country representative are in the team for each specific country (country, number);
SELECT country, COUNT(country_representatives) AS numberOfRepresentatives
FROM data
WHERE country_representatives = 'x'
GROUP BY country

// 5. Determine the average age in the team;
SELECT AVG(age)
FROM team

// 6. Determine the average age for each role (role, age);
SELECT role, AVG(age)
FROM team
GROUP BY role

// 7. Present the youngest and the oldest player in the team (player_name, age);
SELECT player_name, age
FROM team
WHERE age = (SELECT MIN(age) FROM team) 
OR age = (SELECT MAX(age) FROM team)

// 8. Determine team’s market value;
SELECT SUM(market_value)
FROM data

// 9. Present the market value structure ASC (player_name, market_value);
SELECT player_name, market_value
FROM data AS data
INNER JOIN team AS team
ON data.player_number = team.player_number
ORDER BY market_value

// 10. Present the market value structure for each role ASC (role, player_name, market_value);
SELECT role, player_name, market_value
FROM data AS data
INNER JOIN team AS team
ON data.player_number = team.player_number
ORDER BY role, market_value

// 11. Determine the average market value of the team;
SELECT AVG(market_value)
FROM data

// 12. Determine the average market value for each role (role, market_value);
SELECT role, AVG(market_value)
FROM data AS data
INNER JOIN team AS team
ON data.player_number = team.player_number
GROUP BY role

// 13. Count transfer amount;
SELECT SUM(transfer_amount)
FROM data

// 14. Determine the cheapest and the most expensive player;
SELECT player_name, transfer_amount
FROM data AS data
INNER JOIN team AS team
ON data.player_number = team.player_number
WHERE transfer_amount = (SELECT MIN(transfer_amount) FROM data) 
OR transfer_amount = (SELECT MAX(transfer_amount) FROM data)
ORDER BY transfer_amount

// 15. How many alumnus are in the team;
SELECT COUNT(previous_club_country)
FROM data
WHERE previous_club_country = 'alumnus'

// 16. Determine how many players came to the team from specific countries (country, number);
SELECT country, COUNT(player_number)
FROM data
GROUP BY country

// 17. Show players with the lowest and the highest transfer chance;
SELECT player_name, transfer_chance
FROM team
WHERE transfer_chance = (SELECT MIN(transfer_chance) FROM team) 
OR transfer_chance = (SELECT MAX(transfer_chance) FROM team)
ORDER BY transfer_chance

// 18. How many players stay in the team, if players with transfer chance >= 2 leave;
SELECT COUNT(player_number)
FROM team
WHERE transfer_chance < 2

// 19. Which role will have the biggest gaps, if players with transfer chance 1 or 3 leave;
SELECT TOP 1 role, COUNT(player_number) AS HowManyPlayersLeave
FROM team
WHERE transfer_chance IN ('1','3')
GROUP BY role
ORDER BY HowManyPlayersLeave DESC

// 20. How many players stay in each role, if players with transfer chance >= 2 leave;
SELECT role, COUNT(player_number) AS HowManyPlayersStay
FROM team
WHERE transfer_chance < 2
GROUP BY role
ORDER BY COUNT(player_number)

// 21. The team makes money on selling player, at least as much as his market value. If players with transfer chance >= 2 leave, how much money the team gain?
SELECT SUM(market_value)
FROM data AS data
INNER JOIN team AS team
ON data.player_number = team.player_number
WHERE transfer_chance >= 2	

// 22. The team makes money on selling player, at least as much as his market value. How much money the team gain or lose on selling each player (player name, amount);
SELECT player_name, market_value - transfer_amount AS loseOrGainAmount			
FROM data AS data
INNER JOIN team AS team
ON data.player_number = team.player_number

// 23. The team makes money on selling player, at least as much as his market value.  Count club budget after selling all players (club budget now = 0);
SELECT SUM(market_value)
FROM data

// 24. Each player has market value, transfer amount and transfer chance. Based on this data point one player from each role that has to be sold. Please justify your answer.
SELECT player_name, role, market_value - transfer_amount AS loseOrGainAmount, transfer_chance	
FROM data AS data
INNER JOIN team AS team
ON data.player_number = team.player_number
ORDER BY role

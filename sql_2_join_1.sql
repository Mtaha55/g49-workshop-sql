# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
#
# SELECT * FROM City WHERE Name LIKE 'ping%' ORDER BY Population ASC;
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
#
# SELECT * FROM City WHERE Name LIKE 'ran%' ORDER BY Population DESC;
#
# 3: Count all cities
#
# select count(*) from city;
#
# 4: Get the average population of all cities
#
# select AVG(Population) FROM City;
#
# 5: Get the biggest population found in any of the cities
#
# SELECT MAX(Population) FROM City;
#
# 6: Get the smallest population found in any of the cities
#
# SELECT MIN(Population) FROM City;
#
# 7: Sum the population of all cities with a population below 10000
#
# SELECT SUM(Population) FROM City WHERE Population < 10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
# 
# SELECT COUNT(*) FROM City WHERE CountryCode IN ('MOZ', 'VNM');

# 9: Get individual count of cities for the countrycodes MOZ and VNM
#
# SELECT CountryCode, COUNT(*) FROM City WHERE CountryCode IN ('MOZ', 'VNM') GROUP BY CountryCode;
#
# 10: Get average population of cities in MOZ and VNM
# select CountryCode, AVG(Population) FROM City WHERE CountryCode IN ('MOZ', 'VNM') GROUP BY CountryCode;

#
# 11: Get the countrycodes with more than 200 cities
#
# select  countrycodes, count(*)  as city_count from city group  countryCode  having city_count > 200;
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
# 
# select CountryCode, COUNT(*) AS city_count FROM City GROUP BY CountryCode HAVING COUNT(*) > 200 ORDER BY city_count;

# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
#
# select Name,Language FROM CountryLangauge WHERE CountryCode IN ( select countryCode FROM city where Population between 400 and 500);
# 
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
#
# SELECT Name,language,Population from countrylanguage cl JOIN city ct ON cl.CountryCode =ct.CountryCode WHERE ct.Population BETWEEN 500 and 600 group by ct.Name;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
#
# select name FROM city where CountryCode IN ( select CountryCode FROM City WHERE Population = 122199);
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
#
# SELECT Name FROM City WHERE CountryCode IN (SELECT CountryCode FROM City WHERE Population = 122199) AND Population != 122199;
#
# 17: What are the city names in the country where Luanda is capital?
#
# SELECT City.Name FROM City INNER JOIN Country ON City.CountryCode = Country.Code WHERE Country.Capital = City.ID AND Country.Name = 'Angola';
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
#
# select city.name from city inner join country on city.id = country.capital where country.region = (select region from city inner join country on city.countryCode = Country.code where city.name = 'Yaren');
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
#
# select distinct language from CountryLanguage where countryCode in (select code from country where region = (select region from city inner join country on city.countryCode = country.code where city.name = 'Riga'));
#
# 20: Get the name of the most populous city
#
# SELECT city.name AS 'City', MAX(city.population) AS 'Population'
#
# SELECT name FROM city order by population DESC LIMIT 1;
# 

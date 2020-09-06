/*
Enter your query here.
*/

(SELECT CITY,
        LENGTH(CITY)
 FROM STATION
 ORDER BY LENGTH(CITY), CITY
 LIMIT 1)
UNION
(SELECT CITY,
        LENGTH(CITY)
 FROM STATION
 ORDER BY LENGTH(CITY) DESC, CITY
 LIMIT 1);
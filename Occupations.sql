/*
Enter your query here.
*/

SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN tb1.Name ELSE NULL END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN tb1.Name ELSE NULL END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN tb1.Name ELSE NULL END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN tb1.Name ELSE NULL END) AS Actor
    FROM OCCUPATIONS AS tb1, (
    SELECT Name, row_number() OVER (PARTITION BY Occupation ORDER BY Name) AS rank_num
    FROM OCCUPATIONS) AS temp
WHERE tb1.name = temp.name
GROUP BY rank_num
ORDER BY rank_num;
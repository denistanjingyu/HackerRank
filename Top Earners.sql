/*
Enter your query here.
*/

SELECT MAX(months * salary),
       COUNT(*)
FROM Employee
GROUP BY months * salary
ORDER BY months * salary DESC
LIMIT 1;
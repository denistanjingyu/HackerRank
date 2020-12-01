/*
Enter your query here.
*/

SELECT CEILING(AVG(Salary) - AVG(REPLACE(Salary, '0', '')))
FROM EMPLOYEES;
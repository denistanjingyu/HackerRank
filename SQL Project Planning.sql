/*
Enter your query here.
*/

SELECT s.Start_Date, 
       MIN(e.End_Date)
FROM (SELECT Start_Date
      FROM Projects
      WHERE Start_Date NOT IN (SELECT End_Date 
                               FROM Projects)) s 
JOIN (SELECT End_Date
      FROM Projects
      WHERE End_Date NOT IN (SELECT Start_Date 
                             FROM Projects)) e
WHERE Start_Date < End_Date
GROUP BY s.Start_Date
ORDER BY DATEDIFF(s.Start_Date, MIN(e.End_Date)) DESC, s.Start_Date;
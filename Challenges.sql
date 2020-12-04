/*
Enter your query here.
*/

SELECT C.hacker_id,
       H.name,
       COUNT(C.hacker_id) AS challenges_created
FROM Hackers H
INNER JOIN Challenges C
ON H.hacker_id = C.hacker_id
GROUP BY C.hacker_id, H.name
HAVING challenges_created = (SELECT MAX(temp1.cnt)
                             FROM (SELECT COUNT(hacker_id) AS cnt
                                   FROM Challenges
                                   GROUP BY hacker_id) temp1)
       OR challenges_created IN (SELECT temp2.cnt
                                 FROM (SELECT COUNT(hacker_id) AS cnt
                                       FROM Challenges
                                       GROUP BY hacker_id) temp2
                                 GROUP BY temp2.cnt
                                 HAVING COUNT(temp2.cnt) = 1)
ORDER BY challenges_created DESC, H.hacker_id ASC;
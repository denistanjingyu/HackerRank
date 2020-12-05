/*
Enter your query here.
*/

SELECT H.hacker_id,
       H.name,
       SUM(ms.max_score) AS ts
FROM Hackers H
INNER JOIN (SELECT hacker_id,
                   MAX(score) AS max_score
            FROM Submissions
            GROUP BY hacker_id,
                     challenge_id) ms
ON H.hacker_id = ms.hacker_id
GROUP BY H.hacker_id, H.name
HAVING ts > 0
ORDER BY ts DESC, H.hacker_id ASC;
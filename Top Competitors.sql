/*
Enter your query here.
*/

SELECT h.hacker_id, h.name
FROM Submissions s
INNER JOIN Challenges c
ON s.challenge_id = c.challenge_id
INNER JOIN Difficulty d
ON c.difficulty_level = d.difficulty_level 
INNER JOIN Hackers h
ON s.hacker_id = h.hacker_id
WHERE s.score = d.score AND c.difficulty_level = d.difficulty_level
GROUP BY h.hacker_id, h.name
HAVING COUNT(s.hacker_id) > 1
ORDER BY COUNT(s.hacker_id) DESC, s.hacker_id ASC;
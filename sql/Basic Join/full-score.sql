SELECT h.hacker_id, h.name
FROM submissions s
JOIN challenges c ON c.challenge_id = s.challenge_id
JOIN difficulty d ON d.difficulty_level = c.difficulty_level
JOIN hackers h ON h.hacker_id = s.hacker_id
AND s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(s.hacker_id) > 1
ORDER BY COUNT(s.hacker_id) DESC, s.hacker_id ASC;

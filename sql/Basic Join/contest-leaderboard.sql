SELECT h.hacker_id, h.name, sum(t.max_score)
FROM Hackers h
JOIN (
    SELECT s.hacker_id, max(score) as max_score
    FROM Submissions s
    GROUP BY s.hacker_id, s.challenge_id
) t ON h.hacker_id = t.hacker_id
GROUP BY h.hacker_id, h.name
HAVING sum(t.max_score) > 0
ORDER BY sum(t.max_score) DESC, h.hacker_id ASC;

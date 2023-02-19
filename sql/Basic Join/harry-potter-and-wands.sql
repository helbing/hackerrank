SELECT w.id, wp.age, w.coins_needed, w.power
FROM Wands w
JOIN Wands_Property wp ON wp.code = w.code
WHERE wp.is_evil = 0
AND w.coins_needed = (
    SELECT MIN(coins_needed)
    FROM Wands w1
    JOIN Wands_Property wp1 ON wp1.code = w1.code
    WHERE w1.power = w.power
    AND wp1.age = wp.age
)
ORDER BY w.power DESC, wp.age DESC;

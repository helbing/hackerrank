SELECT MAX(months * salary), count(months * salary)
FROM Employee
WHERE (months * salary) = (
    SELECT MAX(months * salary)
    FROM Employee
);

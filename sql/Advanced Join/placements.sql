SELECT t1.Name
FROM (
    SELECT s.ID, s.Name, p.Salary
    FROM Students s
    JOIN Packages p ON p.ID = s.ID
) t1
JOIN (
    SELECT f.ID, f.Friend_ID, p.Salary
    FROM Friends f
    JOIN Packages p ON p.ID = f.Friend_ID
) t2 ON t2.ID = t1.ID AND t1.Salary < t2.Salary
ORDER BY t2.Salary ASC;

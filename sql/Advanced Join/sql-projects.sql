SELECT Start_Date, MIN(End_Date)
FROM (
    SELECT Start_Date
    FROM Projects
    WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)
    ) t1, (
    SELECT End_Date
    FROM Projects
    WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)
    ) t2
WHERE Start_Date < End_Date
GROUP BY Start_Date
ORDER BY (MIN(End_Date) - Start_Date), Start_Date;

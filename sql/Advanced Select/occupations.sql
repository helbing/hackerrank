SELECT Doctor, Professor, Singer, Actor
FROM (
    SELECT
        NameOrder,
        MAX(CASE Occupation WHEN 'Doctor' THEN Name END) Doctor,
        MAX(CASE Occupation WHEN 'Professor' THEN Name END) Professor,
        MAX(CASE Occupation WHEN 'Singer' THEN Name END) Singer,
        MAX(CASE Occupation WHEN 'Actor' THEN Name END) Actor
    FROM (
        SELECT
            Occupation,
            Name,
            row_number() OVER(PARTITION BY Occupation ORDER BY Name ASC) NameOrder
        FROM Occupations
    ) t1
    GROUP BY NameOrder
) t2

SET @r = 0;

SELECT ROUND(AVG(Lat_N), 4)
FROM (
    SELECT (@r := @r + 1) r, Lat_N
    FROM Station
    ORDER BY Lat_N
) t
WHERE r = (SELECT CEIL(COUNT(*) / 2) FROM Station)
OR r = (SELECT FLOOR((COUNT(*) / 2) + 1) FROM Station);

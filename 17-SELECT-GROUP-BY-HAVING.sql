INSERT INTO hilight
SELECT pc.starid FROM

(SELECT s.starid, COUNT(p.planetid) AS p_count
FROM stars AS s JOIN planets AS p
ON s.starid=p.starid
GROUP BY s.starid) AS pc

JOIN

(SELECT p.starid, COUNT(m.moonid) AS m_count
FROM planets AS p JOIN moons AS m
ON p.planetid=m.planetid
GROUP BY p.starid) AS mc

ON pc.starid=mc.starid

ORDER BY p_count+m_count DESC
LIMIT 1

-- Средние показания по комнатам
SELECT r.name, s.kind, ROUND(AVG(rd.value),2) AS avg_v
FROM readings rd
JOIN sensors s ON rd.sensor_id=s.id
JOIN rooms r ON s.room_id=r.id
GROUP BY r.id, s.kind;

-- Максимум по каждому датчику
SELECT s.name, MAX(rd.value) FROM readings rd
JOIN sensors s ON rd.sensor_id=s.id
GROUP BY s.id;

-- Отклонения от среднего
SELECT s.name, rd.value, rd.ts,
       rd.value - (SELECT AVG(value) FROM readings r2 WHERE r2.sensor_id=rd.sensor_id) AS diff
FROM readings rd JOIN sensors s ON rd.sensor_id=s.id;

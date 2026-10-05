CREATE TABLE rooms (id INTEGER PRIMARY KEY, name TEXT);
CREATE TABLE sensors (id INTEGER PRIMARY KEY, room_id INTEGER,
    kind TEXT, name TEXT);
CREATE TABLE readings (sensor_id INTEGER, value REAL, ts DATETIME);

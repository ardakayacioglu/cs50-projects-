.mode csv
.headers on
DROP TABLE IF EXISTS meteorites_temp;
CREATE TABLE meteorites_temp (
    id TEXT,
    name TEXT,
    nametype TEXT,
    recclass TEXT,
    mass TEXT,
    fall TEXT,
    year TEXT,
    reclat TEXT,
    reclong TEXT
);
.import meteorites.csv meteorites_temp

DROP TABLE IF EXISTS meteorites;
CREATE TABLE meteorites (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    class TEXT,
    mass REAL,
    discovery TEXT,
    year INTEGER,
    lat REAL,
    long REAL
);

INSERT INTO meteorites (name, class, mass, discovery, year, lat, long)
SELECT
    name,
    recclass,
    ROUND(CAST(NULLIF(mass, '') AS REAL), 2),
    fall,
    CAST(SUBSTR(year, 1, 4) AS INTEGER),
    ROUND(CAST(NULLIF(reclat, '') AS REAL), 2),
    ROUND(CAST(NULLIF(reclong, '') AS REAL), 2)
FROM meteorites_temp
WHERE nametype != 'Relict'
ORDER BY
    CAST(SUBSTR(year, 1, 4) AS INTEGER),
    name;

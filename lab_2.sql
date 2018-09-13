CREATE DATABASE lab2;

CREATE TABLE countries(
  country_id SERIAL PRIMARY KEY,
  country_name VARCHAR(50),
  region_id INTEGER ,
  population INTEGER DEFAULT 0
);
INSERT INTO countries VALUES ( 1,'ALMATY', 02, 1806833);
INSERT INTO countries (country_id, country_name) VALUES (3, 'AKTOBE');
INSERT INTO countries (country_id, country_name) VALUES (DEFAULT , 'KARAGANDA');
INSERT INTO countries (country_id, country_name,population) VALUES (DEFAULT , 'AKTOBE', 86950);
INSERT INTO countries (country_id, region_id) VALUES (DEFAULT ,NULL);
INSERT INTO countries VALUES (DEFAULT , 'AKTAU',12, 500000 ),
                             (DEFAULT , 'URALSK', 07, 600000),
                             (DEFAULT , 'SEMEY', 16, 458000);
DELETE FROM countries WHERE country_id>7;
ALTER TABLE ONLY countries ALTER COLUMN country_name SET DEFAULT 'KAZAKHSTAN';
INSERT INTO countries (country_name) VALUES (DEFAULT );
INSERT INTO countries DEFAULT VALUES ;
CREATE TABLE countries_new(LIKE countries INCLUDING ALL );
INSERT INTO countries_new SELECT * FROM countries;
UPDATE countries SET region_id = 1 WHERE region_id IS NULL;
UPDATE countries SET population = (population*1.1)
RETURNING country_name, population AS "New Population";
DELETE FROM countries WHERE population<100000;
DELETE FROM countries_new USING countries WHERE countries_new.country_id=countries.country_id
RETURNING *;
DELETE FROM countries RETURNING *;

SELECT * FROM countries;
SELECT * FROM countries_new;


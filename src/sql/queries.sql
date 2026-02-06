

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1
--1. **What are the first 10 recorded observations?**  
     --_Use LIMIT to show only part of the table._;
select * from observations
limit 10;


-- MISSION 2
-- 2. **Which region identifiers (`region_id`) appear in the data?**  
     --_Use SELECT DISTINCT to avoid duplicates._;
SELECT DISTINCT region_id
from observations;


-- MISSION 3
-- How many distinct species (species_id) have been observed?
--Combine COUNT with DISTINCT to avoid counting duplicates.;
select count (distinct species_id)
from observations;


-- MISSION 4
-- 4. **How many observations are there for the region with `region_id = 2`?**  
---_Apply a condition with WHERE._;

select count (*) from observations
where region_id= 2;


-- MISSION 5
-- How many observations were recorded on 1998-08-08?
--Filter by exact date using equality.;
select count (*) from observations
where observation_date= "1998-08-08";


-- MISSION 6
-- Which region_id has the most observations?
--Group by region and count how many times each appears.;
select region_id, count(*) as observation_count
from observations
group by region_id
order by observation_count desc
limit 1;


-- MISSION 7
-- ¿Cuáles son los 5 species_id más frecuentes?
---Agrupa, ordena por cantidad descendente y limita el resultado.;
SELECT species_id, COUNT(*) AS cantidad
FROM observations
GROUP BY species_id
ORDER BY cantidad DESC
LIMIT 5;

-- MISSION 8
-- **Which species (`species_id`) have fewer than 5 records?**  
---  _Group by species and use HAVING to apply a condition._;
select species_id, count(*) as cantidad
from observations
group by species_id
having cantidad < 5;

--- 9 Which observers (observer) recorded the most observations?
---Group by observer name and count the records.;
select observer, count(*) as cantidad
from observations
group by observer
order by cantidad desc
limit 1;

---10. **Show the region name (`regions.name`) for each observation.**  
---Join `observations` with `regions` using `region_id`._;

SELECT o.id, r.name AS region_name
FROM observations o
JOIN regions r
ON o.region_id = r.id;


----11. **Show the scientific name of each recorded species (`species.scientific_name`).**  
 ---     _Join `observations` with `species` using `species_id`._;

SELECT o.id, s.scientific_name
FROM observations o
JOIN species s
ON o.species_id = s.id;

---12. **Which is the most observed species in each region?**  
---      _Group by region and species, and order by count._;
SELECT r.name AS region_name, s.scientific_name, COUNT(*) AS observation_count
FROM observations o
JOIN regions r ON o.region_id = r.id
JOIN species s ON o.species_id = s.id
GROUP BY r.id, s.id
ORDER BY r.id, observation_count DESC;



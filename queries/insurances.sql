-- 1.
SELECT id, type FROM insurances WHERE annual_cost > 400;

-- 2.
SELECT id FROM insurances WHERE percentage_covered >= 30;

-- 3.
SELECT id, start_date, end_date FROM insurances WHERE start_date < "2021-01-01";
SELECT id, start_date, end_date FROM insurances WHERE EXTRACT(YEAR FROM start_date) < 2021;

-- 4.
SELECT id, start_date, end_date FROM insurances WHERE start_date >= "2019-01-01" AND start_date <= "2021-12-31";
SELECT id, start_date, end_date FROM insurances WHERE EXTRACT(YEAR FROM start_date) >= 2019 AND EXTRACT(YEAR FROM start_date) <= 2021;
SELECT id, start_date, end_date FROM insurances WHERE EXTRACT(YEAR FROM start_date) BETWEEN 2019 AND 2021;

-- 5.
SELECT id, start_date, end_date, annual_cost FROM insurances WHERE annual_cost > 400 OR start_date >= "2019-01-01" AND start_date <= "2019-12-31";
SELECT id, start_date, end_date, annual_cost FROM insurances WHERE annual_cost > 400 OR EXTRACT(YEAR FROM start_date) = 2019;

-- ==== JOIN ==== 
-- 1.
SELECT clients.id AS client_id, insurances.id AS insurance_id, clients.name, insurances.type, insurances.annual_cost FROM clients JOIN insurances ON insurances.client_id = clients.id;

-- 2.
SELECT vehicles.plate_number, vehicles.price, insurances.annual_cost FROM vehicles JOIN insurances ON vehicles.insurance_id = insurances.id WHERE insurances.type = "VEHICLE";

-- 3.
SELECT clients.name, properties.area, properties.city, insurances.annual_cost FROM clients JOIN insurances ON clients.id = insurances.client_id JOIN properties ON properties.insurance_id = insurances.id WHERE insurances.type = "PROPERTY"; 

-- ==== GROUP ====
-- 1.
SELECT SUM(annual_cost) FROM insurances;

-- 2.
SELECT MAX(annual_cost) FROM insurances;
SELECT MIN(annual_cost) FROM insurances;

-- 3.
SELECT id, client_id, annual_cost FROM insurances WHERE annual_cost = (SELECT MAX(annual_cost) FROM insurances);
SELECT id, client_id, annual_cost FROM insurances WHERE annual_cost = (SELECT MIN(annual_cost) FROM insurances);

-- 4.
SELECT clients.id, clients.name, insurances.annual_cost FROM insurances JOIN clients ON insurances.client_id = clients.id WHERE insurances.annual_cost = (SELECT MAX(annual_cost) FROM insurances);

-- 5.
SELECT SUM(annual_cost) FROM insurances WHERE EXTRACT(YEAR FROM start_date) = 2021;

-- 6.
SELECT AVG(price) FROM vehicles;

-- 7.
SELECT COUNT(insurances_id) FROM properties;
SELECT COUNT(*) FROM insurances WHERE type = "PROPERTY";

-- 8.
SELECT type, SUM(annual_cost) FROM insurances GROUP BY type;

-- 9.
SELECT clients.name, SUM(insurances.annual_cost) AS total_annual_cost FROM clients JOIN insurances ON clients.id = insurances.client_id GROUP BY client_id;
SELECT client_id FROM insurances, SUM(annual_cost) FROM  GROUP BY client_id; 

-- 10.
SELECT clients.name, client_id, type, SUM(insurances.annual_cost) AS total_annual_cost FROM clients JOIN insurances ON clients.id = insurances.client_id GROUP BY insurances.client_id, insurances.type;
SELECT client_id, type, SUM(annual_cost) FROM insurances GROUP BY client_id, type;

-- 11.
SELECT clients.name, client_id, type, COUNT(insurances.type) AS total_type_count FROM clients JOIN insurances ON clients.id = insurances.client_id GROUP BY insurances.client_id, insurances.type;
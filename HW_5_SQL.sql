USE hw_5;

CREATE TABLE cars (
id INT PRIMARY KEY NOT NULL,
Name VARCHAR(50) NOT NULL,
cost INT NOT NULL);

INSERT INTO cars
VALUES
	(1 , 'Audi', 52642),
	(2 , 'Mercedes', 57127),
    (3 , 'Skoda', 9000),
    (4 , 'Volvo', 29000),
    (5 , 'Bentley', 350000),
    (6 , 'Citroen', 21000),
    (7 , 'Hummer', 41400),
    (8 , 'Volkswagen', 21600);
    
SELECT * FROM cars;
-- 1.1 Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов


CREATE VIEW cars_1_1 AS
SELECT * FROM Cars
WHERE cost < 25000;

SELECT * FROM Cars_1_1;


-- 1.2  Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW cars_1_1 AS
SELECT * FROM Cars
WHERE cost < 30000;

SELECT * FROM Cars_1_1;

-- 1.3 Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE VIEW cars_1_3 AS
SELECT * FROM Cars
WHERE name = "Audi" OR name = "Skoda";

SELECT * FROM Cars_1_3;

CREATE TABLE `hw_5`.`analysis` (
  `an_id` INT NOT NULL AUTO_INCREMENT,
  `an_name` VARCHAR(45) NULL,
  `an_cost` INT NULL,
  `an_price` INT NULL,
  `an_group` VARCHAR(45) NULL,
  PRIMARY KEY (`an_id`),
  UNIQUE INDEX `an_id_UNIQUE` (`an_id` ASC) VISIBLE);


-- 2. Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
SELECT an_name, an_price, ord_datetime
FROM Analysis
JOIN Orders
ON Analysis.an_id = Orders.ord_an
AND Orders.ord_datetime >= '2020-02-05 00:00:00'
AND Orders.ord_datetime <= '2020-02-12 23:59:59';

CREATE TABLE train (
  train_id integer NOT NULL,
  station varchar(20) NOT NULL,
  station_time time NOT NULL
);

INSERT train 
    (train_id, station, station_time)
  VALUES 
    (110, 'San Francisco', '10:00:00'),
    (110, 'Redwood City', '10:54:00'),
    (110, 'Palo Alto', '11:02:00'),
    (110, 'San Jose', '12:35:00'),
    (120, 'San Francisco', '11:00:00'),
    (120, 'Palo Alto', '12:49:00'),
    (120, 'San Jose', '13:30:00');
SELECT * FROM train;
SELECT
  train_id, station, station_time,
  TIMEDIFF(LEAD(station_time) OVER (PARTITION BY train_id ORDER BY station_time), station_time) 
    AS time_to_next_station 
FROM train;

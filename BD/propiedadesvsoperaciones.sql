USE sakila; -- usar este esquema / base de datos
SELECT DATABASE(); -- verifica que se use la base de datos seleccionada
SHOW TABLES; -- muestra tablas
SHOW COLUMNS FROM actor; -- ve la info de las tablas con las restricciones y demás
SHOW COLUMNS FROM inventory;
-- para no poner SHOW
DESC city;
SELECT * FROM language; -- el * sirve para que te muestr todas las columnas y filas de una tabla
-- si sale null es por algun error o indica el final de la tabla
SELECT * FROM city; -- si se puede por teoria de conjuntos pero es una mala practica tener 
-- tablas y colunas con el mismo nombre
-- ejemplo
SELECT city, city FROM city; 
-- mejor manera sin ser ambiguos es más rápido en manejo de memoria
SELECT sakila.city.city, sakila.city.city FROM sakila.city; 
SELECT city, last_update FROM sakila.city; -- orden de las columnas como quieras ponerlas
SELECT * FROM itc501.prueba;
SELECT * FROM sakila.language WHERE name = 'English'; -- esquema sakila tabla lenguaje datos que sean del idioma ingles
SELECT first_name FROM sakila.actor WHERE actor_id = 3; -- una tabla que contiene el 3 valor del actor_id
SELECT sakila.city.city FROM sakila.city WHERE sakila.city.country_id = 15; -- todas las ciudades del pais con id 15
-- todas las ciudades que tengan un id menor a 5
SELECT sakila.city.city FROM sakila.city WHERE sakila.city.city_id < 5; -- primeros registros en ciudades de sucursales
-- multiples elementos con operaciones, desea buscar todos losidiomas que no tienen un language_id de 2
SELECT language_id, name FROM sakila.language WHERE language_id <> 2; 
-- <> distinto de para mayor eficiencia se usa más en db / medianamente rápido
-- != distinto de más lento
-- NOT distinto de más rápido / es el mejor
DESC sakila.actor;
SELECT first_name, last_name FROM sakila.actor WHERE first_name < 'B'; -- nombres de los actores que empiecen con la primera letra del abcedario
SELECT first_name, last_name FROM sakila.actor WHERE first_name < 'B' AND last_name <'B'; -- misma letra en nombre y apellido
-- regex: permite detectar patrones específicos en una cadena de texto
-- todas las peliculas que tienen la palabra familia en el título
SELECT title FROM sakila.film WHERE title LIKE '%family%'; -- todos los tutilos que tengan la palabra familia
-- algo con prefijos, se usan regex
-- = numeros / like cadenas
-- video home --> son peliculas de bajo presupuesto que no llegan al cine
-- usar desambiguador en la tabla si se quiere ver mejor y ayudar
SELECT title, actors FROM sakila.film_list WHERE actors LIKE 'NAT_%'; -- peliculas con primer actor que sus nombres empiezan en NAT
SELECT title, actors FROM sakila.film_list WHERE actors LIKE '%_AMS'; -- sufijo
SELECT title, actors FROM sakila.film_list WHERE actors LIKE '%_williams_%'; -- infijo
SELECT title FROM sakila.film_list WHERE category LIKE 'Sci-Fi' AND rating LIKE 'PG'; -- peliculas de science fiction reated PG 
SELECT title FROM sakila.film_list WHERE category LIKE 'Children' OR category LIKE 'Family'; -- titulos para ver en familia
DESC sakila.language;

SELECT language_id, name FROM sakila.language WHERE NOT (language_id = 2); -- no sean del lenguaje 2

SELECT name FROM sakila.customer_list ORDER BY name ASC LIMIT 10;  -- de menor a mayor, los clientes hasta el 10
SELECT name FROM sakila.customer_list ORDER BY name DESC LIMIT 10; -- descendinte

SELECT address FROM sakila.address ORDER BY last_update DESC LIMIT 5; -- dirección de las ultimas personas
SELECT address, district FROM sakila.address ORDER BY district, address;  -- ordena por distrito y despues por dirección
SELECT address FROM sakila.address ORDER BY district, address;
SELECT address, district FROM sakila.address ORDER BY district ASC, address DESC LIMIT 10; -- distict es para que no se repitan las cosas / o elementos distintas
SELECT name FROM customer_list LIMIT 5, 5; 
SELECT id, name FROM sakila.customer_list ORDER BY id LIMIT 10 OFFSET 5; -- offset empieza desde cierto punto
SELECT id, name FROM sakila.customer_list ORDER BY id LIMIT 5, 10;
SELECT DISTINCT first_name FROM sakila.actor ORDER BY first_name DESC LIMIT 10;


-- INSERT agrega elementos
DESC sakila.language; -- te enseña el orden
INSERT INTO sakila.language VALUES (NULL, 'Portuguese', NOW()); -- null por auto increment entonces lo llena solo/opcion de que pongas el dato o que el lo ponga por ti
-- reservas el espacio que quieres/si no te acuerdas del orden, puede generae errores
SELECT * FROM sakila.language;

SELECT MAX(language_id) FROM language; -- 
INSERT INTO sakila.language VALUES (11, 'Russian', '2022-09-26 10:35:00');
SELECT * FROM sakila.language;

INSERT INTO sakila.language VALUES (NULL, 'Spanish', NOW()),(NULL, 'Hebrew', NOW()); -- más eficiente se hace un solo commit por las transacciones en memoria solo una vez
-- web para que no se sature el ancho de banda 
INSERT INTO sakila.language VALUES (NULL, 'Spanish', NOW());
INSERT INTO sakila.language VALUES (NULL, 'Hebrew', NOW());
SELECT * FROM sakila.language;

-- forma 1
 -- otra forma/como ya tiene ese auto complete, no necesitas la llave primaria null
INSERT INTO sakila.language (name, last_update) VALUES ('Hungarian', NOW()); -- 2 da más efectiva porque ya sabes el orden
SELECT * FROM sakila.language;

-- forma 2
-- cambiar el orden, puedes darle los valores en el orden que te acuerdes
INSERT INTO sakila.language (last_update, name) VALUES ('Hungarian', NOW()); 

-- forma 3 // inserciones individuales
-- otra forma
INSERT INTO sakila.language SET name='German', last_update=NOW();

-- otra inserción
-- varias ciudades al mismo pais
DESC sakila.country;
SELECT country FROM sakila.country WHERE country_id=19;
INSERT INTO sakila.city (city, country_id) VALUES ('Sao Carlos, 19'), ('Araquara', 19), ('Riberiao Preto', 19);

-- otra forma
INSERT INTO sakila.country SET country_id=NULL, country='Bahamas',
last_update=NOW();

-- otras cosas del select
-- cuando ay muchas id's son foreign keys

DESC sakila.payment;
SELECT DISTINCT amount FROM sakila.payment; -- elementos diferentes distinto/ distintas cantidades en las que te han pagado
SELECT MAX(amount) FROM sakila.payment; -- MAXIA CANTIDA QUE TE HAN PAGADO, FUNCION AGLOMERATIVA
SELECT MAX(amount) as "VIP", MIN(amount) as "Tranza", AVG(amount) as "Cualquier persona" FROM sakila.payment;

DESC sakila.city;
DESC sakila.country;

SELECT a.city, b.country FROM sakila.city as a INNER JOIN sakila.country as b  ON a.country_id = b.country_id GROUP BY (a.city_id);
-- agrupa la info 
-- TIPOS DE COSAS EN BASES DE DATOS: SELECCION  CONCATENACION PROJECCION UNION DIVISION DIFERENCIA

-- DELETE
USE sakila;
SET SQL_SAFE_UPDATES = 0; -- Eliminar filas sin formato seguro
SELECT * FROM sakila.rental;
DELETE FROM sakila.rental WHERE rental_id < 10; -- Eliminar todas las filas de una tabla
SELECT * FROM sakila.rental;

SELECT * FROM sakila.payment;
DELETE FROM sakila.payment ORDER BY customer_id LIMIT 10000; -- elimina todas las filas hasta la 10000

-- para eliminar muchos registros
TRUNCATE TABLE sakila.paymrnt; -- elimina todo el contenido pero no la estructura / es más rápida
-- DROP SCHEMA SAKILA;
-- Drop elimina la estructura de datos / toda la tabla
-- DELETE ELIMINA DATOS y deja tabla vacia

UPDATE sakila.payment SET amount = amount*1.1; -- comparación, inserción multiplicar cada una de las filas de la columna amount
UPDATE sakila.payment SET amount = amount*1.1 WHERE payment_id < 30; -- camia las filas donde su payment id sea menor de 30

UPDATE sakila.actor SET last_name = UPPER('cruz') WHERE first_name LIKE 'PENELOPE' AND last_name LIKE 'GUINESS'; -- cambia el apellido de la actriz penelope guiness a penelope cruz
UPDATE sakila.payment SET last_update= NOW() LIMIT 10; -- cambia la hora para las primeras 10 filas a la hora actual ejecutada

-- concatenacion en db

-- join
-- INNER JOIN agarra dos tablas que tengan columnas en comun para poderlas unir

SELECT city, country FROM sakila.city INNER JOIN sakila.country USING (country_id) WHERE country.country_id < 5 ORDER BY country, city; -- ciudad y país que las dos estan en tablas distintas la columna country_id está en ambas tablas/cuidades de los primeros 5 paises
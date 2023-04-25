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
-- INSERT agrega elementos
INSERT INTO sakila.language VALUES (NULL, 'Portuguese', NOW()); -- null por auto increment
SELECT * FROM sakila.language;

SELECT MAX(language_id) FROM language; -- 
INSERT INTO sakila.language VALUES (8, 'Portuguese', '2020-09-26 10:35:00');
SELECT * FROM sakila.language;

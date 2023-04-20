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
SELECT title FROM sakila.film WHERE title LIKE '%family%'; -- algo con prefijos, se usan regex
-- = numeros / like cadenas
-- video home --> son peliculas de bajo presupuesto que no llegan al cine
SELECT title, actors FROM sakila.film_list WHERE actors LIKE 'NAT_%'; -- peliculas con actores que sus nombres empiezan en NAT
SELECT title FROM film_list WHERE category LIKE 'Sci-Fi' AND rating LIKE 'PG'; -- peliculas de science fiction reated PG 

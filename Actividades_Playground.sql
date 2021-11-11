/* Desde el sector comercial de Musimundos nos informan que van a añadir un nuevo género de música a nuestra plataforma. Necesitan que les ayudemos a cargarlo en nuestra base de datos. Insertemos en la tabla generos el id 26 y el nombre Cumbia.
Insertá tu query en mayúsculas. */
INSERT INTO generos(id, nombre)
VALUES(26, 'Cumbia');


/* Viene el manager de Musimundos y, para organizar su inventario de discos, te pide un informe con todos los álbumes que posee la empresa. Realiza una consulta que devuelva todos los álbumes.
Ingresa de la columna titulo el nombre del álbum que aparece quinto. */
-- Big ones
SELECT *
FROM albumes;


/* Para realizar un control de ventas, Musimundos te pide el primer nombre y teléfono de todos sus clientes.
Insertá el número de teléfono del segundo cliente que obtuviste. */
-- +49 0711 2842222
SELECT primer_nombre, telefono
FROM clientes;


/* Seleccionemos los nombres de todos los clientes, una vez obtenidos, necesitamos que obtengas solo aquellos que sean de USA.
Insertá el nombre del tercer cliente que obtuviste. */
-- Michelle
SELECT *
FROM clientes
WHERE pais = 'USA';


/* Vamos a ponernos un poco más finos con la selección. El departamento de canciones te pide un informe de aquellas cuya duración sea entre 200.000 y 300.000 milisegundos. ¿Te animás?
Insertá el nombre de la quinta canción que obtuviste. */
-- Inject The Venom
SELECT *
FROM canciones
WHERE milisegundos BETWEEN 200000 AND 300000;


/* ¡URGENTE! Una banda argentina acaba de sacar un álbum y nos pidió una lista de clientes hispanohablantes para poder divulgar su producto. Te pedimos que obtengas una lista de clientes cuyo país de origen sea Spain o Argentina. ¡Suerte con eso!
Seleccioná el nombre del primer cliente que te aparezca. */
-- Enrique
SELECT *
FROM clientes
WHERE pais = 'Argentina' OR pais = 'Spain';


/* Musimundos desea agregar una lista con todos los géneros, pero ordenados por nombre de manera alfabética.
Insertá el nombre del tercer género que hayas obtenido. */
-- Blues
SELECT *
FROM generos
ORDER BY nombre;


/* Los gerentes están muy satisfechos con tu trabajo, pero las tareas todavía no terminan.
Ahora necesitan una lista con solamente los nombres de los clientes de Musimundos, ordenada por país de origen (descendente) y, como segundo parámetro, por ciudad. ¿Estás listo?
Seleccioná el nombre del séptimo cliente que encuentres. */
-- Frank
SELECT primer_nombre
FROM clientes
ORDER BY pais DESC, ciudad;


/* Utilizemos el nuevo operador LIKE.
Musimundos nos pide un listado de todas las canciones cuyos compositores empiecen con "A". ¿Fácil, no? 
Insertá el nombre de la cuarta canción que obtuviste.
Tip: No debemos preocuparnos por las mayúsculas y minúsculas, ya que el LIKE no hace distinción entre las mismas. */
-- Inject The Venom
SELECT nombre, compositor
FROM canciones
WHERE compositor LIKE 'a%';


/* Ahora, Musimundos sube la apuesta y necesita un listado de géneros que contengan, en alguna parte del nombre, la sigla "ro".
Insertá el nombre del último género que obtuviste.
Tip: No debemos preocuparnos por las mayúsculas y minúsculas, ya que el LIKE no hace distinción entre las mismas. */
-- Electronica/Dance
SELECT nombre
FROM generos
WHERE nombre LIKE '%ro%';


/* Ayer hablé con el gerente y está chocho con el trabajo que venimos realizando. ¡Felicitaciones!
Tan solo pidió una última tarea. En Musimundos necesitan hacer un chequeo de canciones y solicitan una lista de las que tengan un id entre 10 y 20.
Ingresá el nombre de la segunda canción que hayas obtenido. */
-- C.O.D.
SELECT id, nombre
FROM canciones
WHERE id BETWEEN 10 AND 20;


/* El encargado del equipo de UX de Musimundos solicita hacer un pequeño slide con solo tres canciones de nuestra colección. Además, pide que sean las tres con mayor duración. ¡Vamos con eso!
Insertá el ID del álbum de las tres canciones que obtuviste, en orden, sin espacios y separados por coma. */
-- 227,229,253
SELECT nombre, id_album, milisegundos
FROM canciones
ORDER BY milisegundos DESC
LIMIT 3;


/* Tenemos un nuevo comunicado del departamento de UX.
En esta ocasión necesitan hacer una paginación de canciones. La primera página ya está resuelta, pero para la segunda debes saltear cinco canciones y traer las próximas cinco. Estas deben estar ordenadas alfabéticamente por nombre.
Insertá el compositor de la tercera canción que obtuviste. */
-- Santana
SELECT *
FROM canciones
ORDER BY nombre ASC
LIMIT 5
OFFSET 5;


/* Decidimos que "nombre" era un poco ambigüo para una columna de tipos de medios. Por eso, Musimundos te pide una lista de los nombres de tipos de medio en una columna que se llame "nombres_de_medios".
Insertá el primer nombre de medio que obtuviste. */
SELECT nombre AS nombres_de_medios
FROM tipos_de_medio;


/* Desde el departamento de desarrollo de Musimundos están preparando la parte de la aplicación en la cual accedemos a una canción en particular. Nos comentan que debajo de la imagen de la canción deberá aparecer un texto específico, y necesitan nuestra ayuda. El texto tiene que ser:
"La canción " (nombre del tema) " fue compuesta por " (compositor del tema).
Hacé una consulta a nuestra base de datos que nos traiga el nombre y el compositor de cada tema, sin repeticiones y agregando el texto que el equipo de desarrollo nos mencionaba.
¡Ojo! Tené en cuenta los espacios dentro de los textos que nos pidieron añadir.
Ingresá el primer resultado que obtuviste, sin comillas. */
-- La canción For Those About To Rock (We Salute You) fue compuesta por Angus Young, Malcolm Young, Brian Johnson
SELECT CONCAT('La canción ', nombre, 'fue compuesta por ', compositor,'.')
FROM canciones;


/* Es la semana del rock a nivel mundial y nuestro gerente de Musimundos nos pide crear banners con canciones del género Rock. Debemos hacer una consulta a nuestra base de datos que nos devuelva los nombres de las canciones que tengan género rock.
Seleccioná la cuarta canción que te devuelva la consulta. */
-- Restless and Wild
SELECT canciones.nombre AS Song, generos.nombre As Genre
FROM canciones
INNER JOIN generos
ON canciones.id_genero = generos.id;


/* En el salón Musimundos tenemos un cliente fanático de Deep Purple, este quiere comprar todos los álbumes que tengan como "artista" a Deep Purple. Debemos hacer una consulta a nuestra base de datos que nos traiga el título del álbum y el autor para saber si, lo que le estamos vendiendo, es correcto.
Ingresá el título del álbum en la posición número 10. */
-- Stormbringer
SELECT albumes.titulo AS Album, artistas.nombre As Artist
FROM albumes
INNER JOIN artistas
ON albumes.id_artista = artistas.id
WHERE artistas.nombre = 'Deep Purple';


/* En el departamento de desarrollo de Musimundos están creando la nueva aplicación móvil, en la cual vamos a poder escuchar música online de nuestros artistas favoritos. Para evitar posibles problemas de compatibilidad, los desarrolladores decidieron que solo van a subir canciones que tengan el tipo de medio "MPEG audio file". Debemos ayudar al equipo y obtener una lista en las cuales tengamos el nombre de las canciones que tengan ese tipo de medio.
Seleccioná el nombre de la cuarta canción que obtuviste de la consulta. */
-- Inject The Venom
SELECT canciones.nombre, tipos_de_medio.nombre
FROM canciones
INNER JOIN tipos_de_medio
ON canciones.id_tipo_de_medio = tipos_de_medio.id
WHERE tipos_de_medio.nombre = 'MPEG audio file';


/* 
Desde el sector de recursos humanos de Musimundos nos están solicitando una lista de todos los cargos que tienen los empleados. Realizá una consulta a nuestra base de datos que nos brinde el título de los cargos que tengan todos los empleados sin repetirse medio.
Ingresá el título que figura en la posición 4. */
-- IT Manager
SELECT DISTINCT titulo AS cargo 
FROM empleados;


/* Genera una consulta a la base Musimundos que cuente todas las canciones por genero y las agrupe por id_genero. Seleccioná el total del quinto registro. */
-- 12
SELECT COUNT(canciones.id_genero), generos.nombre
FROM canciones
INNER JOIN generos
ON canciones.id_genero = generos.id
GROUP BY id_genero;


/* El área de estrategia de Musimundos está analizando cómo implementar una acción de marketing en la cual tiene que destinar un presupuesto acorde a la cantidad de clientes que tenga cada país. Por esto nos pide que los ayudemos a identificar la cantidad de clientes que son de Brazil.
Generá una consulta en la base de datos que traiga la cuenta de todos los clientes que son de Brazil.
Ingresá el número que te dio como resultado. */
-- 5
SELECT COUNT(pais), pais
FROM clientes
GROUP BY pais;


/* Es época de balances y en Musimundos quieren saber cuánto es el dinero que la gente lleva gastado en la empresa.
Hacé una consulta a la base de datos que sume el total de todas las facturas que emitió la empresa.
Ingresá el número que obtuviste. */
-- 2328.60
SELECT SUM(total)
FROM facturas;


/* En el equipo de desarrollo están mudando de servidor a nuestra aplicación y quieren saber cuál es el peso de cada archivo de canciones para buscar un servidor adecuado con capacidad suficiente.
Hacé una consulta a la base de datos para saber cuál es el archivo con menor peso en bytes.
Ingresá el número que obtuviste. */
-- 38747
SELECT MIN(bytes)
FROM canciones;

/* Se acerca el gerente de Marketing y nos comenta que buscan analizar las facturas que Ingresos está generando por cada país, PERO le interesa los países que hayan generado un total superior a 100.
Ingresá el país correspondiente al segundo registro de la respuesta a la consulta.
TIP: debes utilizar el GROUP BY, el SUM y HAVING para llegar a esta respuesta. Recordá ingresar el país con la primera letra en mayúscula y sin tildes. */
-- Canada
SELECT pais_de_facturacion, SUM(total)
FROM facturas
GROUP BY pais_de_facturacion
HAVING SUM(total) > 100;


/* Desde el departamento de Estrategia están evaluando en qué ciudad tienen más clientes para establecer unas nuevas oficinas.
Es por esto que nos piden un informe donde mostremos, por ciudad, cuántos clientes hay, pero solo contando las ciudades que tengan 2 o más clientes (sabemos que suena poco, pero en estos momentos para la empresa es un montón).
Ingresá la ciudad correspondiente al primer registro de la respuesta a tu consulta.
TIP: debes utilizar el GROUP BY, el COUNT y HAVING para llegar a esta respuesta. Recordá ingresar la ciudad con la primera letra en mayúscula y sin tildes. */
-- Berlin
SELECT COUNT(ciudad), ciudad
FROM clientes
GROUP BY ciudad
HAVING COUNT(ciudad) >= 2;

/* En musimundos estamos muy atentos a que nuestros usuarios encuentren una cantidad apropiada de canciones del estilo que quieran escuchar, es por eso que en esta oportunidad nos están solicitando una lista de cuantas canciones tenemos por género. Hacé una consulta a la base de datos que traiga el nombre del género y la cantidad de canciones que posee.
ingresá el número que te dio como resultado las canciones de género Blues. */
-- 81
SELECT generos.nombre, COUNT(canciones.id_genero)
FROM generos
INNER JOIN canciones
ON generos.id = canciones.id_genero
GROUP BY generos.nombre;


/* En el sitio web de Musimundos queremos mejorar nuestras vistas de productos colocando al pie de cada álbum el promedio de duración de cada álbum. Tomemos como ejemplo a la banda AC/DC y consulta a la base de datos el álbum 'Let There Be Rock' , lista sus canciones , su duración y saca un promedio de duracion de las mismas. 
Insertá el número que obtuviste */
-- 306657.375
SELECT albumes.titulo, canciones.compositor, AVG(canciones.milisegundos)
FROM canciones
INNER JOIN albumes
ON canciones.id_album = albumes.id
GROUP BY albumes.titulo
HAVING canciones.compositor = 'AC/DC';


/* En el salón de Musimundos, estamos ofreciendo una promoción para los clientes regulares donde regalamos un 20% de descuento en su compra si alguna vez el cliente hizo una compra con un total de más de 12. El cliente número 48 acaba de entrar por la puerta y el vendedor quiere corroborar si el descuento se aplica.
Hacé una consulta a la base de datos que nos traiga el total de la factura más cara que tenga el cliente número 48.
Insertá el número que obtuviste. */
-- 13.86
SELECT MAX(total)
FROM facturas
WHERE id_cliente = 48;


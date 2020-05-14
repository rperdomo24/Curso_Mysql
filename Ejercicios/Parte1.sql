--Seccion LIBROS
-- Obtener todos los libros escritos por autores que cuenten con un seudónimo.
SELECT *
from libros
Where autor_id = (select autor_id FROM autores where seudonimo IS NOT NULL);

-- Obtener el título de todos los libros publicados en el año actual cuyos autores poseen un pseudónimo.
SELECT titulo
FROM libros
WHERE autor_id = (SELECT autor_id FROM autores where seudonimo IS NOT NULL)
AND DAYOFYEAR(fecha_creacion) = DAYOFYEAR(NOW());

-- Obtener todos los libros escritos por autores que cuenten con un seudónimo 
-- y que hayan nacido ante de 1965.
SELECT *
from libros
Where autor_id = (
    select autor_id 
    FROM autores 
    where seudonimo IS NOT NULL
    AND fecha_nacimiento < '1965-12-31'
);

--Colocar el mensaje no disponible a la columna descripción, 
--en todos los libros publicados antes del año 2000.
update libros 
set descripcion = 'No disponible'
WHERE fecha_publicacion < '2000-01-01';

-- Obtener la llave primaria de todos los libros cuya descripción sea diferente de no disponible.
select libro_id 
from libros
where descripcion != 'No disponible';

--Obtener el título de los últimos 3 libros escritos por el autor con id 2.
select  titulo
from libros
where autor_id = 2 Limit 2;

--Obtener en un mismo resultado la cantidad de libros escritos por autores con seudónimo y sin seudónimo.

SELECT
    (SELECT COUNT(*)
    from libros
    Where autor_id IN (select autor_id
    FROM autores
    where seudonimo IS NULL)
    ) AS con_seudónimo,
    (SELECT COUNT(*)
    from libros
    Where autor_id IN (select autor_id
    FROM autores
    where seudonimo IS NOT NULL)
    )AS sin_seudónimo;

--Obtener la cantidad de libros publicados entre enero del año 2000 y enero del año 2005.
SELECT COUNT(*)
FROM libros
where fecha_publicacion BETWEEN '2000-01-01' AND '2005-01-31';

--Obtener el título y el número de ventas de los cinco libros más vendidos.
SELECT titulo, ventas 
from libros order by ventas desc limit 5;

--Obtener el título y el número de ventas de los cinco libros más vendidos de la última década.
SELECT titulo, ventas 
from libros where fecha_publicacion BETWEEN '2010-01-01' and '2020-01-31' order by ventas desc limit 5;

-- Obtener la cantidad de libros vendidos por los autores con id 1, 2 y 3.
select autor_id, sum(ventas) from libros  GROUP by autor_id HAVING autor_id IN (1,2,3); 

--Obtener el título del libro con más páginas.
select titulo  from libros order by paginas desc limit 1;

--Obtener todos los libros cuyo título comience con la palabra “La”.
select * from libros WHERE titulo like 'la%';

--Obtener todos los libros cuyo título comience con la palabra “La” y termine con la letra “a”.
select * from libros WHERE titulo like 'la%' and titulo like '%a';

--Establecer el stock en cero a todos los libros publicados antes del año de 1995
update libros set stock= 0 where fecha_publicacion < '1995-01-01';

--Mostrar el mensaje Disponible si el libro con id 1 
--posee más de 5 ejemplares en stock, en caso contrario mostrar el mensaje No disponible.
select If(stock > 5,'Disponible','disponible') from libros where libro_id = 1;

--Obtener el título los libros ordenador por fecha de publicación del más reciente al más viejo.
select titulo, fecha_publicacion from libros order by fecha_publicacion desc;

--AUTORES
--